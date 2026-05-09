; DESCRIPTION: Renders a blue box of size 10x82 starting at (70, 9).
; PLAN: r0=70(x), r1=9(y), r2=10(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 9
LDI r2, 10
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
