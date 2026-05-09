; DESCRIPTION: Places a black line segment connecting (230, 63) to (479, 157).
; PLAN: r0=230(x1), r1=63(y1), r2=479(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 63
LDI r2, 479
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
