; DESCRIPTION: Places a red line segment connecting (357, 214) to (296, 19).
; PLAN: r0=357(x1), r1=214(y1), r2=296(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 214
LDI r2, 296
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
