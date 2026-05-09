; DESCRIPTION: Renders a magenta line between points (361, 177) and (236, 45).
; PLAN: r0=361(x1), r1=177(y1), r2=236(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 177
LDI r2, 236
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
