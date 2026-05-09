; DESCRIPTION: Composite: Renders a orange disk with center (357, 78) and radius 49 then Renders a black line between points (44, 95) and (349, 178) then Places a white dot at position (471, 154).
; PLAN: r0=357(x), r1=78(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x1), r6=95(y1), r7=349(x2), r8=178(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=154(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 78
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 95
LDI r7, 349
LDI r8, 178
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 154
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
