; DESCRIPTION: Places a black line segment connecting (244, 188) to (126, 220).
; PLAN: r0=244(x1), r1=188(y1), r2=126(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 188
LDI r2, 126
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
