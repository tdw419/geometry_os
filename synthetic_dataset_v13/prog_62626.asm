; DESCRIPTION: Draws a black line from (349, 57) to (443, 4).
; PLAN: r0=349(x1), r1=57(y1), r2=443(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 57
LDI r2, 443
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
