; DESCRIPTION: Composite: Draws a purple line from (212, 32) to (378, 170) then Renders a purple box of size 104x113 starting at (344, 100) then Places a green dot at position (290, 1).
; PLAN: r0=212(x1), r1=32(y1), r2=378(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=100(y), r7=104(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x), r11=1(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 32
LDI r2, 378
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 100
LDI r7, 104
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 1
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
