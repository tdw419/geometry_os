; DESCRIPTION: Composite: Places a blue line segment connecting (174, 20) to (173, 20) then Creates a purple rectangular region at (112, 64) spanning 18 by 34 pixels.
; PLAN: r0=174(x1), r1=20(y1), r2=173(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=64(y), r7=18(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 20
LDI r2, 173
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 64
LDI r7, 18
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
