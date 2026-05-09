; DESCRIPTION: Draws a magenta line from (441, 6) to (38, 174).
; PLAN: r0=441(x1), r1=6(y1), r2=38(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 6
LDI r2, 38
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
