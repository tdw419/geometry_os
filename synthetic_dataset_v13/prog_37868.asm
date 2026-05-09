; DESCRIPTION: Composite: Renders a black line between points (182, 241) and (285, 69) then Places a blue circle of radius 41 at center (76, 130).
; PLAN: r0=182(x1), r1=241(y1), r2=285(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=130(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 241
LDI r2, 285
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 130
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
