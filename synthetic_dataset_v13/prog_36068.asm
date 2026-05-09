; DESCRIPTION: Draws a black line from (25, 244) to (71, 157).
; PLAN: r0=25(x1), r1=244(y1), r2=71(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 244
LDI r2, 71
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
