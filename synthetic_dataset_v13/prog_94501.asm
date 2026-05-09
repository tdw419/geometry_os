; DESCRIPTION: Renders a blue box of size 12x14 starting at (172, 217).
; PLAN: r0=172(x), r1=217(y), r2=12(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 217
LDI r2, 12
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
