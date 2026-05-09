; DESCRIPTION: Draws a orange line from (350, 99) to (290, 64).
; PLAN: r0=350(x1), r1=99(y1), r2=290(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 99
LDI r2, 290
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
