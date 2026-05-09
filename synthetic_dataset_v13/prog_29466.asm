; DESCRIPTION: Composite: Renders a blue line between points (169, 120) and (452, 99) then Places a orange 60x117 rectangle at position (390, 11).
; PLAN: r0=169(x1), r1=120(y1), r2=452(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=11(y), r7=60(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 120
LDI r2, 452
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 11
LDI r7, 60
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
