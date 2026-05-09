; DESCRIPTION: Draws a magenta line from (466, 223) to (84, 86).
; PLAN: r0=466(x1), r1=223(y1), r2=84(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 223
LDI r2, 84
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
