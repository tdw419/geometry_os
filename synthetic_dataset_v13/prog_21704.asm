; DESCRIPTION: Composite: Renders a white disk with center (251, 167) and radius 52 then Draws a green line from (141, 55) to (406, 54).
; PLAN: r0=251(x), r1=167(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=55(y1), r7=406(x2), r8=54(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 167
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 55
LDI r7, 406
LDI r8, 54
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
