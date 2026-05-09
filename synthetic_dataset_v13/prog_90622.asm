; DESCRIPTION: Composite: Draws a purple line from (359, 66) to (428, 38) then Places a cyan dot at position (267, 170) then Renders a green disk with center (151, 178) and radius 10.
; PLAN: r0=359(x1), r1=66(y1), r2=428(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=170(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=178(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 66
LDI r2, 428
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 170
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 151
LDI r11, 178
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
