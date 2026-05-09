; DESCRIPTION: Places a black line segment connecting (147, 1) to (479, 8).
; PLAN: r0=147(x1), r1=1(y1), r2=479(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 1
LDI r2, 479
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
