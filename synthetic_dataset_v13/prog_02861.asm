; DESCRIPTION: Composite: Draws a red line from (319, 161) to (218, 76) then Creates a purple rectangular region at (365, 109) spanning 48 by 101 pixels.
; PLAN: r0=319(x1), r1=161(y1), r2=218(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=109(y), r7=48(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 161
LDI r2, 218
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 109
LDI r7, 48
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
