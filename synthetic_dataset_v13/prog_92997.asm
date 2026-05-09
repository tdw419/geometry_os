; DESCRIPTION: Places a black line segment connecting (385, 188) to (29, 95).
; PLAN: r0=385(x1), r1=188(y1), r2=29(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 188
LDI r2, 29
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
