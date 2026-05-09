; DESCRIPTION: Renders a black line between points (350, 95) and (244, 103).
; PLAN: r0=350(x1), r1=95(y1), r2=244(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 95
LDI r2, 244
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
