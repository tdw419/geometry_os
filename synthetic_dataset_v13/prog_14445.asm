; DESCRIPTION: Renders a blue box of size 37x72 starting at (55, 3).
; PLAN: r0=55(x), r1=3(y), r2=37(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 3
LDI r2, 37
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
