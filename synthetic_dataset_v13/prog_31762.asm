; DESCRIPTION: Composite: Renders a red box of size 73x51 starting at (233, 86) then Places a purple circle of radius 70 at center (76, 130).
; PLAN: r0=233(x), r1=86(y), r2=73(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=130(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 86
LDI r2, 73
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 130
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
