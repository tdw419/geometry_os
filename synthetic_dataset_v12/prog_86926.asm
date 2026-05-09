; DESCRIPTION: Places a black line segment connecting (302, 164) to (16, 6).
; PLAN: r0=302(x1), r1=164(y1), r2=16(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 164
LDI r2, 16
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
