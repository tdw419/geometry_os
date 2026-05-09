; DESCRIPTION: Composite: Renders a black disk with center (124, 223) and radius 19 then Renders a cyan line between points (170, 159) and (371, 179).
; PLAN: r0=124(x), r1=223(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x1), r6=159(y1), r7=371(x2), r8=179(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 223
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 159
LDI r7, 371
LDI r8, 179
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
