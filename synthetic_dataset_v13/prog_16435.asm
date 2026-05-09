; DESCRIPTION: Composite: Creates a red rectangular region at (149, 44) spanning 29 by 98 pixels then Places a green line segment connecting (420, 167) to (364, 157).
; PLAN: r0=149(x), r1=44(y), r2=29(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=167(y1), r7=364(x2), r8=157(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 44
LDI r2, 29
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 167
LDI r7, 364
LDI r8, 157
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
