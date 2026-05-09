; DESCRIPTION: Composite: Creates a orange rectangular region at (398, 172) spanning 72 by 68 pixels then Places a yellow line segment connecting (244, 31) to (29, 186).
; PLAN: r0=398(x), r1=172(y), r2=72(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x1), r6=31(y1), r7=29(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 172
LDI r2, 72
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 31
LDI r7, 29
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
