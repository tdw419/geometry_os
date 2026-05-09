; DESCRIPTION: Composite: Draws a orange rectangle at (273, 4) with width 44 and height 120 then Draws a purple line from (188, 160) to (160, 47).
; PLAN: r0=273(x), r1=4(y), r2=44(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x1), r6=160(y1), r7=160(x2), r8=47(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 4
LDI r2, 44
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 160
LDI r7, 160
LDI r8, 47
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
