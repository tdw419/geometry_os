; DESCRIPTION: Composite: Draws a white line from (52, 245) to (344, 254) then Places a green dot at position (180, 84) then Places a yellow circle of radius 12 at center (120, 123).
; PLAN: r0=52(x1), r1=245(y1), r2=344(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=84(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=120(x), r11=123(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 245
LDI r2, 344
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 84
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 120
LDI r11, 123
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
