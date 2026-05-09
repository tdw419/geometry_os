; DESCRIPTION: Composite: Places a blue line segment connecting (179, 191) to (242, 241) then Creates a white rectangular region at (356, 97) spanning 53 by 118 pixels.
; PLAN: r0=179(x1), r1=191(y1), r2=242(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=97(y), r7=53(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 191
LDI r2, 242
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 97
LDI r7, 53
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
