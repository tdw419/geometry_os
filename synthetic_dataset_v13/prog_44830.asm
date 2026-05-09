; DESCRIPTION: Composite: Places a blue line segment connecting (379, 125) to (464, 137) then Creates a red rectangular region at (162, 112) spanning 69 by 62 pixels.
; PLAN: r0=379(x1), r1=125(y1), r2=464(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=112(y), r7=69(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 125
LDI r2, 464
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 112
LDI r7, 69
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
