; DESCRIPTION: Composite: Places a black circle of radius 26 at center (233, 142) then Renders a white line between points (427, 205) and (423, 21).
; PLAN: r0=233(x), r1=142(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=205(y1), r7=423(x2), r8=21(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 142
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 205
LDI r7, 423
LDI r8, 21
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
