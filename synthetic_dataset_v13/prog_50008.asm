; DESCRIPTION: Composite: Draws a yellow rectangle at (441, 77) with width 24 and height 44 then Renders a black line between points (247, 120) and (97, 217) then Sets a single orange pixel at (385, 200).
; PLAN: r0=441(x), r1=77(y), r2=24(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x1), r6=120(y1), r7=97(x2), r8=217(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=200(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 77
LDI r2, 24
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 120
LDI r7, 97
LDI r8, 217
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 200
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
