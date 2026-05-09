; DESCRIPTION: Composite: Renders a purple line between points (451, 144) and (183, 230) then Places a red 28x48 rectangle at position (229, 110).
; PLAN: r0=451(x1), r1=144(y1), r2=183(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=110(y), r7=28(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 144
LDI r2, 183
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 110
LDI r7, 28
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
