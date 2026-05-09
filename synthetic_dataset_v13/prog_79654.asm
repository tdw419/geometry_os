; DESCRIPTION: Draws a blue line from (124, 168) to (361, 177).
; PLAN: r0=124(x1), r1=168(y1), r2=361(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 168
LDI r2, 361
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
