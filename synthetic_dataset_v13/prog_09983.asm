; DESCRIPTION: Places a black line segment connecting (125, 206) to (148, 206).
; PLAN: r0=125(x1), r1=206(y1), r2=148(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 206
LDI r2, 148
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
