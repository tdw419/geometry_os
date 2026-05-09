; DESCRIPTION: Draws a magenta line from (367, 92) to (409, 133).
; PLAN: r0=367(x1), r1=92(y1), r2=409(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 92
LDI r2, 409
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
