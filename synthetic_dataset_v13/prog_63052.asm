; DESCRIPTION: Composite: Places a cyan line segment connecting (116, 217) to (473, 160) then Creates a magenta rectangular region at (35, 224) spanning 118 by 14 pixels.
; PLAN: r0=116(x1), r1=217(y1), r2=473(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=224(y), r7=118(width), r8=14(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 217
LDI r2, 473
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 224
LDI r7, 118
LDI r8, 14
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
