; DESCRIPTION: Composite: Places a magenta dot at position (247, 54) then Draws a red line from (110, 188) to (104, 21) then Draws a magenta circle centered at (199, 164) with radius 53.
; PLAN: r0=247(x), r1=54(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=188(y1), r7=104(x2), r8=21(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=164(y), r12=53(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 54
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 188
LDI r7, 104
LDI r8, 21
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 164
LDI r12, 53
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
