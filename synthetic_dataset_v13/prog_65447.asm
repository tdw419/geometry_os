; DESCRIPTION: Composite: Renders a white line between points (398, 193) and (299, 198) then Sets a single yellow pixel at (498, 239) then Creates a purple rectangular region at (264, 103) spanning 18 by 85 pixels.
; PLAN: r0=398(x1), r1=193(y1), r2=299(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=498(x), r6=239(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=103(y), r12=18(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 193
LDI r2, 299
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 239
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 264
LDI r11, 103
LDI r12, 18
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
