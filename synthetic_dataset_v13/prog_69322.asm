; DESCRIPTION: Composite: Creates a blue rectangular region at (142, 136) spanning 80 by 66 pixels then Places a blue line segment connecting (425, 81) to (190, 109).
; PLAN: r0=142(x), r1=136(y), r2=80(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=81(y1), r7=190(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 136
LDI r2, 80
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 81
LDI r7, 190
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
