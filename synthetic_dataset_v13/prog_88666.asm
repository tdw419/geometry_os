; DESCRIPTION: Composite: Renders a purple line between points (229, 102) and (153, 128) then Renders a red box of size 26x74 starting at (38, 68).
; PLAN: r0=229(x1), r1=102(y1), r2=153(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=68(y), r7=26(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 102
LDI r2, 153
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 68
LDI r7, 26
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
