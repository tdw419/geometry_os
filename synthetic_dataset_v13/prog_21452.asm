; DESCRIPTION: Draws a black line from (436, 133) to (39, 200).
; PLAN: r0=436(x1), r1=133(y1), r2=39(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 133
LDI r2, 39
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
