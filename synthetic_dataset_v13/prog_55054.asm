; DESCRIPTION: Draws a yellow line from (290, 1) to (440, 23).
; PLAN: r0=290(x1), r1=1(y1), r2=440(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 1
LDI r2, 440
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
