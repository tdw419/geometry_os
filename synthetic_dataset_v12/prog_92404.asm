; DESCRIPTION: Draws a black line from (20, 74) to (471, 71).
; PLAN: r0=20(x1), r1=74(y1), r2=471(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 74
LDI r2, 471
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
