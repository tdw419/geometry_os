; DESCRIPTION: Renders a blue box of size 24x115 starting at (454, 15).
; PLAN: r0=454(x), r1=15(y), r2=24(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 15
LDI r2, 24
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
