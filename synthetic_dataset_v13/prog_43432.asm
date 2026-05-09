; DESCRIPTION: Composite: Renders a purple box of size 104x66 starting at (7, 120) then Draws a orange line from (123, 133) to (158, 203).
; PLAN: r0=7(x), r1=120(y), r2=104(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=133(y1), r7=158(x2), r8=203(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 120
LDI r2, 104
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 133
LDI r7, 158
LDI r8, 203
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
