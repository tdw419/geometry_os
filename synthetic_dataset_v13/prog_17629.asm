; DESCRIPTION: Composite: Draws a green line from (427, 3) to (323, 88) then Places a cyan dot at position (349, 186) then Draws a blue circle centered at (44, 27) with radius 17.
; PLAN: r0=427(x1), r1=3(y1), r2=323(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=186(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=44(x), r11=27(y), r12=17(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 427
LDI r1, 3
LDI r2, 323
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 186
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 44
LDI r11, 27
LDI r12, 17
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
