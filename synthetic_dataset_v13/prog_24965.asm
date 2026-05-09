; DESCRIPTION: Composite: Creates a green rectangular region at (447, 112) spanning 19 by 58 pixels then Places a blue line segment connecting (306, 222) to (455, 115).
; PLAN: r0=447(x), r1=112(y), r2=19(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x1), r6=222(y1), r7=455(x2), r8=115(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 112
LDI r2, 19
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 222
LDI r7, 455
LDI r8, 115
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
