; DESCRIPTION: Composite: Places a black dot at position (229, 244) then Draws a purple line from (232, 78) to (219, 221) then Places a cyan circle of radius 23 at center (260, 91).
; PLAN: r0=229(x), r1=244(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=78(y1), r7=219(x2), r8=221(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=91(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 244
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 232
LDI r6, 78
LDI r7, 219
LDI r8, 221
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 91
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
