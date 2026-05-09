; DESCRIPTION: Draws a black line from (317, 2) to (226, 244).
; PLAN: r0=317(x1), r1=2(y1), r2=226(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 2
LDI r2, 226
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
