; DESCRIPTION: Renders a blue box of size 38x119 starting at (264, 26).
; PLAN: r0=264(x), r1=26(y), r2=38(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 26
LDI r2, 38
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
