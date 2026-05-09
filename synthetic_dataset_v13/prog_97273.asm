; DESCRIPTION: Composite: Places a green line segment connecting (444, 151) to (450, 241) then Draws a purple rectangle at (110, 19) with width 87 and height 57.
; PLAN: r0=444(x1), r1=151(y1), r2=450(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=19(y), r7=87(width), r8=57(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 151
LDI r2, 450
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 19
LDI r7, 87
LDI r8, 57
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
