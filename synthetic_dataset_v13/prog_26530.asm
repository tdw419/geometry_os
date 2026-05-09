; DESCRIPTION: Composite: Draws a yellow rectangle at (126, 190) with width 19 and height 22 then Renders a orange line between points (402, 229) and (382, 223).
; PLAN: r0=126(x), r1=190(y), r2=19(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=229(y1), r7=382(x2), r8=223(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 190
LDI r2, 19
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 229
LDI r7, 382
LDI r8, 223
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
