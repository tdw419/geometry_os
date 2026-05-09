; DESCRIPTION: Composite: Renders a red box of size 61x85 starting at (378, 133) then Sets a single green pixel at (329, 37) then Draws a orange line from (389, 3) to (338, 114).
; PLAN: r0=378(x), r1=133(y), r2=61(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=37(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=389(x1), r11=3(y1), r12=338(x2), r13=114(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 133
LDI r2, 61
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 37
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 389
LDI r11, 3
LDI r12, 338
LDI r13, 114
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
