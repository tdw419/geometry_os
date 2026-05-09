; DESCRIPTION: Composite: Renders a purple box of size 76x117 starting at (296, 57) then Draws a orange line from (417, 161) to (1, 126).
; PLAN: r0=296(x), r1=57(y), r2=76(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x1), r6=161(y1), r7=1(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 57
LDI r2, 76
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 161
LDI r7, 1
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
