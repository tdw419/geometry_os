; DESCRIPTION: Draws a black line from (339, 243) to (429, 252).
; PLAN: r0=339(x1), r1=243(y1), r2=429(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 243
LDI r2, 429
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
