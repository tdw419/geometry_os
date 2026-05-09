; DESCRIPTION: Draws a magenta line from (129, 150) to (259, 37).
; PLAN: r0=129(x1), r1=150(y1), r2=259(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 150
LDI r2, 259
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
