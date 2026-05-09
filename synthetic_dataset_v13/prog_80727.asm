; DESCRIPTION: Composite: Places a black line segment connecting (162, 181) to (405, 230) then Places a magenta circle of radius 61 at center (134, 167) then Sets a single white pixel at (447, 83).
; PLAN: r0=162(x1), r1=181(y1), r2=405(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=167(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x), r11=83(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 162
LDI r1, 181
LDI r2, 405
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 167
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 83
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
