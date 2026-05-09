; DESCRIPTION: Composite: Renders a cyan disk with center (261, 130) and radius 52 then Renders a white line between points (77, 18) and (430, 99).
; PLAN: r0=261(x), r1=130(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x1), r6=18(y1), r7=430(x2), r8=99(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 130
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 18
LDI r7, 430
LDI r8, 99
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
