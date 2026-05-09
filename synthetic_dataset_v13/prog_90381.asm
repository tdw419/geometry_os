; DESCRIPTION: Composite: Places a red line segment connecting (265, 168) to (110, 3) then Creates a black rectangular region at (388, 53) spanning 67 by 41 pixels.
; PLAN: r0=265(x1), r1=168(y1), r2=110(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=53(y), r7=67(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 168
LDI r2, 110
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 53
LDI r7, 67
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
