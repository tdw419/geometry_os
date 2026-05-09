; DESCRIPTION: Composite: Draws a orange line from (473, 132) to (277, 103) then Sets a single yellow pixel at (240, 65) then Renders a white box of size 118x110 starting at (98, 71).
; PLAN: r0=473(x1), r1=132(y1), r2=277(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=65(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=71(y), r12=118(width), r13=110(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 132
LDI r2, 277
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 65
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 98
LDI r11, 71
LDI r12, 118
LDI r13, 110
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
