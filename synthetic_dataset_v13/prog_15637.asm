; DESCRIPTION: Composite: Sets a single orange pixel at (199, 239) then Draws a orange line from (294, 19) to (428, 114) then Creates a yellow circular shape at (381, 208) with radius 34.
; PLAN: r0=199(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=19(y1), r7=428(x2), r8=114(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=208(y), r12=34(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 294
LDI r6, 19
LDI r7, 428
LDI r8, 114
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 208
LDI r12, 34
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
