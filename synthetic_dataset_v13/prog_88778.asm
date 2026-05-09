; DESCRIPTION: Composite: Places a magenta line segment connecting (335, 253) to (220, 158) then Draws a yellow rectangle at (330, 212) with width 18 and height 16 then Sets a single red pixel at (102, 123).
; PLAN: r0=335(x1), r1=253(y1), r2=220(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=212(y), r7=18(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=123(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 253
LDI r2, 220
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 212
LDI r7, 18
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 123
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
