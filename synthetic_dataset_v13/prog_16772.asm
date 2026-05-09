; DESCRIPTION: Composite: Renders a magenta box of size 33x96 starting at (257, 78) then Sets a single red pixel at (347, 0) then Draws a red line from (447, 69) to (182, 173).
; PLAN: r0=257(x), r1=78(y), r2=33(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=0(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=447(x1), r11=69(y1), r12=182(x2), r13=173(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 78
LDI r2, 33
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 0
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 447
LDI r11, 69
LDI r12, 182
LDI r13, 173
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
