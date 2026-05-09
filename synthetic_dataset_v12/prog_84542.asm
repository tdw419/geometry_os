; DESCRIPTION: Draws a magenta line from (270, 137) to (61, 174).
; PLAN: r0=270(x1), r1=137(y1), r2=61(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 137
LDI r2, 61
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
