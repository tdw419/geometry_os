; DESCRIPTION: Composite: Places a blue line segment connecting (407, 250) to (419, 210) then Creates a green rectangular region at (233, 176) spanning 45 by 53 pixels.
; PLAN: r0=407(x1), r1=250(y1), r2=419(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=176(y), r7=45(width), r8=53(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 250
LDI r2, 419
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 176
LDI r7, 45
LDI r8, 53
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
