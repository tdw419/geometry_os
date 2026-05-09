; DESCRIPTION: Draws a blue line from (401, 17) to (293, 203).
; PLAN: r0=401(x1), r1=17(y1), r2=293(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 17
LDI r2, 293
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
