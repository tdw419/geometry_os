; DESCRIPTION: Composite: Places a orange circle of radius 19 at center (180, 165) then Draws a magenta line from (348, 228) to (297, 38) then Sets a single blue pixel at (489, 25).
; PLAN: r0=180(x), r1=165(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=228(y1), r7=297(x2), r8=38(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=489(x), r11=25(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 165
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 228
LDI r7, 297
LDI r8, 38
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 25
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
