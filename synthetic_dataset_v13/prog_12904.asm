; DESCRIPTION: Composite: Draws a cyan rectangle at (12, 159) with width 110 and height 20 then Draws a purple line from (218, 192) to (2, 52).
; PLAN: r0=12(x), r1=159(y), r2=110(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x1), r6=192(y1), r7=2(x2), r8=52(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 159
LDI r2, 110
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 192
LDI r7, 2
LDI r8, 52
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
