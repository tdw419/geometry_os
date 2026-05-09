; DESCRIPTION: Composite: Places a cyan line segment connecting (44, 192) to (149, 49) then Creates a black rectangular region at (228, 118) spanning 111 by 100 pixels.
; PLAN: r0=44(x1), r1=192(y1), r2=149(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=118(y), r7=111(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 192
LDI r2, 149
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 118
LDI r7, 111
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
