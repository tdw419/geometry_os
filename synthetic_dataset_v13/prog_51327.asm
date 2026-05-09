; DESCRIPTION: Composite: Creates a green rectangular region at (142, 20) spanning 33 by 110 pixels then Places a yellow line segment connecting (415, 157) to (27, 0).
; PLAN: r0=142(x), r1=20(y), r2=33(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=157(y1), r7=27(x2), r8=0(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 20
LDI r2, 33
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 157
LDI r7, 27
LDI r8, 0
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
