; DESCRIPTION: Composite: Draws a magenta line from (421, 229) to (380, 111) then Places a orange dot at position (73, 20) then Creates a orange circular shape at (114, 97) with radius 58.
; PLAN: r0=421(x1), r1=229(y1), r2=380(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=20(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=97(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 229
LDI r2, 380
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 20
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 114
LDI r11, 97
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
