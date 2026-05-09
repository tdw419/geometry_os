; DESCRIPTION: Composite: Sets a single purple pixel at (383, 95) then Draws a orange line from (218, 163) to (500, 65) then Places a magenta circle of radius 21 at center (130, 178).
; PLAN: r0=383(x), r1=95(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x1), r6=163(y1), r7=500(x2), r8=65(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=178(y), r12=21(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 95
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 163
LDI r7, 500
LDI r8, 65
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 178
LDI r12, 21
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
