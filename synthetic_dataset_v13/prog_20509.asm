; DESCRIPTION: Composite: Renders a green box of size 20x56 starting at (152, 174) then Places a purple line segment connecting (266, 145) to (268, 231).
; PLAN: r0=152(x), r1=174(y), r2=20(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=145(y1), r7=268(x2), r8=231(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 174
LDI r2, 20
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 145
LDI r7, 268
LDI r8, 231
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
