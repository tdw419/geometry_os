; DESCRIPTION: Composite: Renders a green box of size 96x49 starting at (408, 204) then Sets a single red pixel at (503, 37) then Places a black line segment connecting (458, 251) to (51, 113).
; PLAN: r0=408(x), r1=204(y), r2=96(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x), r6=37(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=458(x1), r11=251(y1), r12=51(x2), r13=113(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 204
LDI r2, 96
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 37
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 458
LDI r11, 251
LDI r12, 51
LDI r13, 113
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
