; DESCRIPTION: Draws a black line from (98, 254) to (371, 169).
; PLAN: r0=98(x1), r1=254(y1), r2=371(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 254
LDI r2, 371
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
