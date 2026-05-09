; DESCRIPTION: Draws a yellow line from (385, 109) to (477, 125).
; PLAN: r0=385(x1), r1=109(y1), r2=477(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 109
LDI r2, 477
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
