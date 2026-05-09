; DESCRIPTION: Draws a orange line from (364, 147) to (401, 71).
; PLAN: r0=364(x1), r1=147(y1), r2=401(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 147
LDI r2, 401
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
