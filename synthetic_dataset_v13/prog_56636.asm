; DESCRIPTION: Draws a black line from (113, 153) to (471, 250).
; PLAN: r0=113(x1), r1=153(y1), r2=471(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 153
LDI r2, 471
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
