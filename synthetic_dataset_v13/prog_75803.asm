; DESCRIPTION: Composite: Draws a blue line from (390, 198) to (286, 75) then Renders a green box of size 27x80 starting at (214, 139).
; PLAN: r0=390(x1), r1=198(y1), r2=286(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=139(y), r7=27(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 198
LDI r2, 286
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 139
LDI r7, 27
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
