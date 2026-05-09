; DESCRIPTION: Draws a blue line from (172, 98) to (491, 15).
; PLAN: r0=172(x1), r1=98(y1), r2=491(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 98
LDI r2, 491
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
