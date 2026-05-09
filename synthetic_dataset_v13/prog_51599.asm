; DESCRIPTION: Composite: Draws a black line from (141, 85) to (423, 177) then Creates a white rectangular region at (175, 104) spanning 62 by 87 pixels.
; PLAN: r0=141(x1), r1=85(y1), r2=423(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=104(y), r7=62(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 85
LDI r2, 423
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 104
LDI r7, 62
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
