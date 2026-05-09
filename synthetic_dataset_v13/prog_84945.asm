; DESCRIPTION: Draws a yellow line from (223, 0) to (141, 220).
; PLAN: r0=223(x1), r1=0(y1), r2=141(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 0
LDI r2, 141
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
