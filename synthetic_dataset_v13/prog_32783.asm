; DESCRIPTION: Draws a magenta line from (401, 13) to (56, 133).
; PLAN: r0=401(x1), r1=13(y1), r2=56(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 13
LDI r2, 56
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
