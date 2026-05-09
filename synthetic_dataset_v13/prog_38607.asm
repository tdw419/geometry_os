; DESCRIPTION: Composite: Places a orange dot at position (363, 143) then Draws a black line from (344, 30) to (485, 6) then Renders a yellow disk with center (142, 144) and radius 52.
; PLAN: r0=363(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=344(x1), r6=30(y1), r7=485(x2), r8=6(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=144(y), r12=52(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 344
LDI r6, 30
LDI r7, 485
LDI r8, 6
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 144
LDI r12, 52
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
