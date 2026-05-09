; DESCRIPTION: Renders a blue box of size 48x82 starting at (278, 6).
; PLAN: r0=278(x), r1=6(y), r2=48(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 6
LDI r2, 48
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
