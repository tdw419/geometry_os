; DESCRIPTION: Composite: Renders a orange disk with center (444, 57) and radius 52 then Places a red line segment connecting (209, 189) to (301, 202) then Places a cyan dot at position (462, 199).
; PLAN: r0=444(x), r1=57(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=189(y1), r7=301(x2), r8=202(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=199(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 444
LDI r1, 57
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 189
LDI r7, 301
LDI r8, 202
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 199
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
