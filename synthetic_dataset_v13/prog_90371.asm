; DESCRIPTION: Composite: Places a green line segment connecting (393, 139) to (104, 56) then Creates a white rectangular region at (37, 159) spanning 96 by 81 pixels.
; PLAN: r0=393(x1), r1=139(y1), r2=104(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=159(y), r7=96(width), r8=81(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 139
LDI r2, 104
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 159
LDI r7, 96
LDI r8, 81
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
