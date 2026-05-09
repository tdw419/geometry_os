; DESCRIPTION: Draws a blue line from (401, 137) to (283, 69).
; PLAN: r0=401(x1), r1=137(y1), r2=283(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 137
LDI r2, 283
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
