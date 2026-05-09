; DESCRIPTION: Renders a blue box of size 49x83 starting at (217, 12).
; PLAN: r0=217(x), r1=12(y), r2=49(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 12
LDI r2, 49
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
