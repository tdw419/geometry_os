; DESCRIPTION: Composite: Renders a green box of size 115x94 starting at (387, 12) then Draws a orange line from (342, 212) to (212, 22) then Draws a magenta circle centered at (337, 91) with radius 50.
; PLAN: r0=387(x), r1=12(y), r2=115(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=212(y1), r7=212(x2), r8=22(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=91(y), r12=50(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 12
LDI r2, 115
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 212
LDI r7, 212
LDI r8, 22
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 91
LDI r12, 50
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
