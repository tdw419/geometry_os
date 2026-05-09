; DESCRIPTION: Draws a magenta line from (379, 150) to (241, 124).
; PLAN: r0=379(x1), r1=150(y1), r2=241(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 150
LDI r2, 241
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
