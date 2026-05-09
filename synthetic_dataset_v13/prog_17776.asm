; DESCRIPTION: Composite: Renders a white disk with center (223, 76) and radius 53 then Renders a blue line between points (494, 198) and (116, 237).
; PLAN: r0=223(x), r1=76(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=198(y1), r7=116(x2), r8=237(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 76
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 198
LDI r7, 116
LDI r8, 237
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
