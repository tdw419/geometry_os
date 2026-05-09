; DESCRIPTION: Places a magenta line segment connecting (441, 143) to (376, 174).
; PLAN: r0=441(x1), r1=143(y1), r2=376(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 143
LDI r2, 376
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
