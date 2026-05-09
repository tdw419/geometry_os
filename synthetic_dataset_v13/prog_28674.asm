; DESCRIPTION: Composite: Sets a single yellow pixel at (257, 59) then Places a red circle of radius 14 at center (301, 137) then Draws a orange line from (111, 202) to (357, 240).
; PLAN: r0=257(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=137(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x1), r11=202(y1), r12=357(x2), r13=240(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 137
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 202
LDI r12, 357
LDI r13, 240
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
