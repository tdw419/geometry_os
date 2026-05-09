; DESCRIPTION: Draws a black line from (244, 76) to (85, 255).
; PLAN: r0=244(x1), r1=76(y1), r2=85(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 76
LDI r2, 85
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
