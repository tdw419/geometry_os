; DESCRIPTION: Renders a magenta line between points (238, 178) and (361, 82).
; PLAN: r0=238(x1), r1=178(y1), r2=361(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 178
LDI r2, 361
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
