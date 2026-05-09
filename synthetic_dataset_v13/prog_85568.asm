; DESCRIPTION: Draws a magenta line from (466, 234) to (391, 78).
; PLAN: r0=466(x1), r1=234(y1), r2=391(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 234
LDI r2, 391
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
