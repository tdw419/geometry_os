; DESCRIPTION: Composite: Places a white line segment connecting (57, 68) to (136, 221) then Creates a purple rectangular region at (133, 43) spanning 70 by 76 pixels.
; PLAN: r0=57(x1), r1=68(y1), r2=136(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=43(y), r7=70(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 68
LDI r2, 136
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 43
LDI r7, 70
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
