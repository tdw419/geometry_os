; DESCRIPTION: Draws a black line from (74, 122) to (422, 163).
; PLAN: r0=74(x1), r1=122(y1), r2=422(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 122
LDI r2, 422
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
