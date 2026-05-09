; DESCRIPTION: Draws a magenta line from (222, 144) to (283, 187).
; PLAN: r0=222(x1), r1=144(y1), r2=283(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 144
LDI r2, 283
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
