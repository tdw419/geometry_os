; DESCRIPTION: Composite: Draws a purple line from (295, 240) to (468, 207) then Places a cyan dot at position (232, 125) then Renders a purple disk with center (404, 120) and radius 80.
; PLAN: r0=295(x1), r1=240(y1), r2=468(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=404(x), r11=120(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 240
LDI r2, 468
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 120
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
