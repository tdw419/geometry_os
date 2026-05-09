; DESCRIPTION: Draws a black line from (254, 70) to (189, 44).
; PLAN: r0=254(x1), r1=70(y1), r2=189(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 70
LDI r2, 189
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
