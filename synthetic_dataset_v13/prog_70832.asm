; DESCRIPTION: Draws a magenta line from (76, 250) to (335, 113).
; PLAN: r0=76(x1), r1=250(y1), r2=335(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 250
LDI r2, 335
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
