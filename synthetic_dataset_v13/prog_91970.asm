; DESCRIPTION: Draws a magenta line from (461, 202) to (433, 250).
; PLAN: r0=461(x1), r1=202(y1), r2=433(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 202
LDI r2, 433
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
