; DESCRIPTION: Places a black line segment connecting (165, 231) to (76, 83).
; PLAN: r0=165(x1), r1=231(y1), r2=76(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 231
LDI r2, 76
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
