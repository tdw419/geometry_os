; DESCRIPTION: Composite: Renders a red disk with center (102, 129) and radius 73 then Renders a black line between points (427, 183) and (295, 205) then Sets a single green pixel at (203, 60).
; PLAN: r0=102(x), r1=129(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=183(y1), r7=295(x2), r8=205(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=60(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 102
LDI r1, 129
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 183
LDI r7, 295
LDI r8, 205
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 60
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
