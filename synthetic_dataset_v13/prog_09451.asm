; DESCRIPTION: Composite: Places a green circle of radius 10 at center (17, 201) then Places a cyan line segment connecting (457, 243) to (494, 201).
; PLAN: r0=17(x), r1=201(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x1), r6=243(y1), r7=494(x2), r8=201(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 201
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 243
LDI r7, 494
LDI r8, 201
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
