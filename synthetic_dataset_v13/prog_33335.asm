; DESCRIPTION: Renders a black line between points (423, 2) and (307, 73).
; PLAN: r0=423(x1), r1=2(y1), r2=307(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 2
LDI r2, 307
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
