; DESCRIPTION: Draws a black line from (12, 84) to (244, 204).
; PLAN: r0=12(x1), r1=84(y1), r2=244(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 84
LDI r2, 244
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
