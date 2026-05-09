; DESCRIPTION: Composite: Renders a orange disk with center (149, 70) and radius 31 then Draws a red line from (17, 221) to (283, 70) then Sets a single orange pixel at (54, 193).
; PLAN: r0=149(x), r1=70(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=221(y1), r7=283(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=193(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 70
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 221
LDI r7, 283
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 193
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
