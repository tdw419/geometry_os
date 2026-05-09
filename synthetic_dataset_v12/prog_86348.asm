; DESCRIPTION: Draws a black line from (436, 197) to (149, 128).
; PLAN: r0=436(x1), r1=197(y1), r2=149(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 197
LDI r2, 149
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
