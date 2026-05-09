; DESCRIPTION: Places a black line segment connecting (479, 184) to (304, 51).
; PLAN: r0=479(x1), r1=184(y1), r2=304(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 184
LDI r2, 304
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
