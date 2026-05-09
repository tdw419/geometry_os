; DESCRIPTION: Draws a magenta line from (335, 82) to (403, 51).
; PLAN: r0=335(x1), r1=82(y1), r2=403(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 82
LDI r2, 403
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
