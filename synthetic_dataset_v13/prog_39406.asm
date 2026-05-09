; DESCRIPTION: Composite: Draws a yellow line from (285, 127) to (31, 162) then Places a orange circle of radius 11 at center (447, 23).
; PLAN: r0=285(x1), r1=127(y1), r2=31(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=23(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 127
LDI r2, 31
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 23
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
