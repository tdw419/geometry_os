; DESCRIPTION: Draws a magenta line from (57, 124) to (471, 194).
; PLAN: r0=57(x1), r1=124(y1), r2=471(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 124
LDI r2, 471
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
