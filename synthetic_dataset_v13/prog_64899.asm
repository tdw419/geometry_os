; DESCRIPTION: Draws a green line from (357, 145) to (72, 171).
; PLAN: r0=357(x1), r1=145(y1), r2=72(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 145
LDI r2, 72
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
