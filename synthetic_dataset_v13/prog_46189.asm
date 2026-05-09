; DESCRIPTION: Draws a black line from (360, 234) to (119, 206).
; PLAN: r0=360(x1), r1=234(y1), r2=119(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 234
LDI r2, 119
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
