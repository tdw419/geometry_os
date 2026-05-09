; DESCRIPTION: Draws a black line from (466, 31) to (70, 11).
; PLAN: r0=466(x1), r1=31(y1), r2=70(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 31
LDI r2, 70
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
