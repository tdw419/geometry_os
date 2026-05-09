; DESCRIPTION: Draws a red line from (454, 234) to (401, 72).
; PLAN: r0=454(x1), r1=234(y1), r2=401(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 234
LDI r2, 401
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
