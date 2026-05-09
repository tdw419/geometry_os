; DESCRIPTION: Draws a magenta line from (106, 125) to (142, 24).
; PLAN: r0=106(x1), r1=125(y1), r2=142(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 125
LDI r2, 142
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
