; DESCRIPTION: Composite: Creates a blue rectangular region at (328, 82) spanning 78 by 100 pixels then Places a blue line segment connecting (200, 180) to (144, 28).
; PLAN: r0=328(x), r1=82(y), r2=78(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=180(y1), r7=144(x2), r8=28(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 82
LDI r2, 78
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 180
LDI r7, 144
LDI r8, 28
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
