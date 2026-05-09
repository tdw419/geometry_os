; DESCRIPTION: Composite: Places a purple line segment connecting (412, 64) to (95, 125) then Creates a yellow rectangular region at (402, 144) spanning 102 by 84 pixels.
; PLAN: r0=412(x1), r1=64(y1), r2=95(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=144(y), r7=102(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 64
LDI r2, 95
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 144
LDI r7, 102
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
