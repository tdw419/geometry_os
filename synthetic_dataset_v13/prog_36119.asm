; DESCRIPTION: Composite: Draws a purple line from (283, 99) to (132, 190) then Creates a purple rectangular region at (401, 118) spanning 93 by 58 pixels.
; PLAN: r0=283(x1), r1=99(y1), r2=132(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=118(y), r7=93(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 99
LDI r2, 132
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 118
LDI r7, 93
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
