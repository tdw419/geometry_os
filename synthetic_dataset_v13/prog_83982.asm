; DESCRIPTION: Renders a yellow line between points (333, 198) and (342, 79).
; PLAN: r0=333(x1), r1=198(y1), r2=342(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 198
LDI r2, 342
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
