; DESCRIPTION: Composite: Renders a green box of size 104x110 starting at (0, 91) then Renders a purple line between points (107, 69) and (107, 105).
; PLAN: r0=0(x), r1=91(y), r2=104(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=69(y1), r7=107(x2), r8=105(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 91
LDI r2, 104
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 69
LDI r7, 107
LDI r8, 105
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
