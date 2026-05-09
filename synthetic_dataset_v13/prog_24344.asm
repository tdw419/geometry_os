; DESCRIPTION: Composite: Creates a blue rectangular region at (240, 94) spanning 25 by 23 pixels then Places a yellow line segment connecting (447, 250) to (337, 116).
; PLAN: r0=240(x), r1=94(y), r2=25(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x1), r6=250(y1), r7=337(x2), r8=116(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 94
LDI r2, 25
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 250
LDI r7, 337
LDI r8, 116
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
