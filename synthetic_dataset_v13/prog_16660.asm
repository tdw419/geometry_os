; DESCRIPTION: Draws a black line from (387, 65) to (97, 169).
; PLAN: r0=387(x1), r1=65(y1), r2=97(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 65
LDI r2, 97
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
