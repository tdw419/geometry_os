; DESCRIPTION: Composite: Draws a cyan rectangle at (218, 201) with width 85 and height 22 then Renders a blue line between points (279, 161) and (90, 191).
; PLAN: r0=218(x), r1=201(y), r2=85(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=161(y1), r7=90(x2), r8=191(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 201
LDI r2, 85
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 161
LDI r7, 90
LDI r8, 191
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
