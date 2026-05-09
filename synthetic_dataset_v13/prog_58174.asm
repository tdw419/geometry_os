; DESCRIPTION: Composite: Places a black line segment connecting (344, 202) to (358, 49) then Creates a green rectangular region at (238, 67) spanning 104 by 107 pixels.
; PLAN: r0=344(x1), r1=202(y1), r2=358(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=67(y), r7=104(width), r8=107(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 202
LDI r2, 358
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 67
LDI r7, 104
LDI r8, 107
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
