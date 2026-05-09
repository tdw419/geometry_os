; DESCRIPTION: Composite: Sets a single red pixel at (231, 4) then Renders a orange box of size 67x77 starting at (110, 10) then Renders a red line between points (297, 219) and (276, 155).
; PLAN: r0=231(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=10(y), r7=67(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x1), r11=219(y1), r12=276(x2), r13=155(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 110
LDI r6, 10
LDI r7, 67
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 219
LDI r12, 276
LDI r13, 155
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
