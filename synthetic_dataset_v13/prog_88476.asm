; DESCRIPTION: Draws a magenta line from (300, 137) to (165, 199).
; PLAN: r0=300(x1), r1=137(y1), r2=165(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 137
LDI r2, 165
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
