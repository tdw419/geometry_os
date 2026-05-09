; DESCRIPTION: Draws a magenta line from (44, 174) to (275, 189).
; PLAN: r0=44(x1), r1=174(y1), r2=275(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 174
LDI r2, 275
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
