; DESCRIPTION: Composite: Draws a purple line from (234, 149) to (172, 81) then Sets a single cyan pixel at (333, 220) then Places a blue circle of radius 36 at center (387, 156).
; PLAN: r0=234(x1), r1=149(y1), r2=172(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=387(x), r11=156(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 149
LDI r2, 172
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 156
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
