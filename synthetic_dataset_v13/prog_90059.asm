; DESCRIPTION: Draws a orange line from (478, 249) to (317, 71).
; PLAN: r0=478(x1), r1=249(y1), r2=317(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 249
LDI r2, 317
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
