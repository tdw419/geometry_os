; DESCRIPTION: Draws a green line from (133, 199) to (59, 94).
; PLAN: r0=133(x1), r1=199(y1), r2=59(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 199
LDI r2, 59
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
