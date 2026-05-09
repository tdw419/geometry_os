; DESCRIPTION: Composite: Draws a yellow line from (110, 174) to (393, 229) then Places a red dot at position (270, 106) then Places a blue 36x75 rectangle at position (36, 10).
; PLAN: r0=110(x1), r1=174(y1), r2=393(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=106(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=36(x), r11=10(y), r12=36(width), r13=75(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 174
LDI r2, 393
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 106
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 36
LDI r11, 10
LDI r12, 36
LDI r13, 75
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
