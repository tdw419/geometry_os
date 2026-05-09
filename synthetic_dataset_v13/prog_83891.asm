; DESCRIPTION: Draws a yellow line from (387, 123) to (157, 4).
; PLAN: r0=387(x1), r1=123(y1), r2=157(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 123
LDI r2, 157
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
