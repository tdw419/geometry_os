; DESCRIPTION: Composite: Sets a single yellow pixel at (494, 39) then Places a orange circle of radius 15 at center (397, 212) then Draws a yellow line from (200, 22) to (22, 52).
; PLAN: r0=494(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=212(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x1), r11=22(y1), r12=22(x2), r13=52(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 397
LDI r6, 212
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 22
LDI r12, 22
LDI r13, 52
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
