; DESCRIPTION: Composite: Renders a green disk with center (289, 19) and radius 18 then Places a white line segment connecting (141, 76) to (350, 126).
; PLAN: r0=289(x), r1=19(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=76(y1), r7=350(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 19
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 76
LDI r7, 350
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
