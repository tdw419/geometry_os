; DESCRIPTION: Composite: Places a magenta line segment connecting (132, 150) to (335, 88) then Sets a single white pixel at (346, 114) then Places a white circle of radius 58 at center (348, 186).
; PLAN: r0=132(x1), r1=150(y1), r2=335(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=114(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=186(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 150
LDI r2, 335
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 114
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 186
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
