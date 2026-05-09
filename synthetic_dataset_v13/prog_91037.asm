; DESCRIPTION: Composite: Places a orange line segment connecting (154, 49) to (259, 187) then Sets a single orange pixel at (280, 120) then Draws a magenta circle centered at (228, 117) with radius 34.
; PLAN: r0=154(x1), r1=49(y1), r2=259(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=228(x), r11=117(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 49
LDI r2, 259
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 228
LDI r11, 117
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
