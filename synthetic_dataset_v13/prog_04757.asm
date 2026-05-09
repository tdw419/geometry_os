; DESCRIPTION: Composite: Draws a cyan line from (241, 192) to (510, 178) then Places a orange dot at position (230, 90) then Creates a green circular shape at (386, 109) with radius 75.
; PLAN: r0=241(x1), r1=192(y1), r2=510(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=90(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=386(x), r11=109(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 241
LDI r1, 192
LDI r2, 510
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 90
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 386
LDI r11, 109
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
