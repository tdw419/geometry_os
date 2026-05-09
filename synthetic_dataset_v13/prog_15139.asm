; DESCRIPTION: Draws a magenta line from (160, 23) to (144, 54).
; PLAN: r0=160(x1), r1=23(y1), r2=144(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 23
LDI r2, 144
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
