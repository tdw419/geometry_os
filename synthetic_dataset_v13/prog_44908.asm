; DESCRIPTION: Places a black line segment connecting (321, 164) to (43, 6).
; PLAN: r0=321(x1), r1=164(y1), r2=43(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 164
LDI r2, 43
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
