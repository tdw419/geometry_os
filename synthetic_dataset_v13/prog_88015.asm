; DESCRIPTION: Draws a black line from (112, 94) to (39, 5).
; PLAN: r0=112(x1), r1=94(y1), r2=39(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 94
LDI r2, 39
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
