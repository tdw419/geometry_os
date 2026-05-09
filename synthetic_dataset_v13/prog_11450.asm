; DESCRIPTION: Composite: Draws a orange circle centered at (132, 158) with radius 16 then Places a magenta line segment connecting (162, 208) to (290, 220) then Sets a single yellow pixel at (145, 70).
; PLAN: r0=132(x), r1=158(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x1), r6=208(y1), r7=290(x2), r8=220(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=70(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 158
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 208
LDI r7, 290
LDI r8, 220
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 70
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
