; DESCRIPTION: Draws a magenta line from (125, 120) to (223, 87).
; PLAN: r0=125(x1), r1=120(y1), r2=223(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 120
LDI r2, 223
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
