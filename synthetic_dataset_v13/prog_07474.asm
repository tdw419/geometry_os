; DESCRIPTION: Draws a magenta line from (319, 223) to (325, 250).
; PLAN: r0=319(x1), r1=223(y1), r2=325(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 223
LDI r2, 325
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
