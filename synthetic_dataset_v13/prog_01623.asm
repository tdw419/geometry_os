; DESCRIPTION: Draws a magenta line from (348, 133) to (422, 212).
; PLAN: r0=348(x1), r1=133(y1), r2=422(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 133
LDI r2, 422
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
