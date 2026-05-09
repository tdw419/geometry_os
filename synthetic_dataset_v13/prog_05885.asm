; DESCRIPTION: Draws a magenta line from (277, 78) to (178, 199).
; PLAN: r0=277(x1), r1=78(y1), r2=178(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 78
LDI r2, 178
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
