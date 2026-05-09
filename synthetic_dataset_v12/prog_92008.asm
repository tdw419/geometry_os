; DESCRIPTION: Composite: Creates a green rectangular region at (84, 60) spanning 59 by 71 pixels then Places a purple line segment connecting (39, 145) to (39, 58).
; PLAN: r0=84(x), r1=60(y), r2=59(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x1), r6=145(y1), r7=39(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 60
LDI r2, 59
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 145
LDI r7, 39
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
