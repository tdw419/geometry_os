; DESCRIPTION: Composite: Places a blue 97x94 rectangle at position (318, 5) then Renders a orange line between points (263, 52) and (16, 43).
; PLAN: r0=318(x), r1=5(y), r2=97(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=52(y1), r7=16(x2), r8=43(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 5
LDI r2, 97
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 52
LDI r7, 16
LDI r8, 43
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
