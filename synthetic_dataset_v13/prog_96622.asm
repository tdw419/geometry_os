; DESCRIPTION: Places a magenta line segment connecting (441, 79) to (93, 174).
; PLAN: r0=441(x1), r1=79(y1), r2=93(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 79
LDI r2, 93
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
