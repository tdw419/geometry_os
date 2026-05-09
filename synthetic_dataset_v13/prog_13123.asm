; DESCRIPTION: Composite: Renders a blue disk with center (17, 167) and radius 11 then Renders a yellow box of size 89x69 starting at (53, 161).
; PLAN: r0=17(x), r1=167(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=161(y), r7=89(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 167
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 161
LDI r7, 89
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
