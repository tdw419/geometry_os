; DESCRIPTION: Renders a black line between points (472, 252) and (386, 184).
; PLAN: r0=472(x1), r1=252(y1), r2=386(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 252
LDI r2, 386
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
