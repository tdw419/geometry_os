; DESCRIPTION: Composite: Draws a blue line from (462, 66) to (73, 36) then Renders a green box of size 13x104 starting at (233, 26).
; PLAN: r0=462(x1), r1=66(y1), r2=73(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=26(y), r7=13(width), r8=104(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 66
LDI r2, 73
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 26
LDI r7, 13
LDI r8, 104
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
