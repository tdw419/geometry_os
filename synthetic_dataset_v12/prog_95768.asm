; DESCRIPTION: Places a green line segment connecting (479, 222) to (490, 96).
; PLAN: r0=479(x1), r1=222(y1), r2=490(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 222
LDI r2, 490
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
