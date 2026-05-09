; DESCRIPTION: Renders a magenta line between points (428, 234) and (223, 23).
; PLAN: r0=428(x1), r1=234(y1), r2=223(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 234
LDI r2, 223
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
