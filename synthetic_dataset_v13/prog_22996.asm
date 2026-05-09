; DESCRIPTION: Renders a magenta line between points (308, 174) and (441, 193).
; PLAN: r0=308(x1), r1=174(y1), r2=441(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 174
LDI r2, 441
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
