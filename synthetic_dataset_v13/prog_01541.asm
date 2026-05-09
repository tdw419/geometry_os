; DESCRIPTION: Draws a black line from (427, 95) to (120, 19).
; PLAN: r0=427(x1), r1=95(y1), r2=120(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 95
LDI r2, 120
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
