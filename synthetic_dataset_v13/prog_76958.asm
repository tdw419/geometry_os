; DESCRIPTION: Composite: Draws a purple line from (277, 203) to (464, 133) then Sets a single cyan pixel at (248, 208) then Renders a purple disk with center (233, 86) and radius 48.
; PLAN: r0=277(x1), r1=203(y1), r2=464(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=208(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=233(x), r11=86(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 203
LDI r2, 464
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 208
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 86
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
