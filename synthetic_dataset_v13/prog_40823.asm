; DESCRIPTION: Places a blue line segment connecting (479, 75) to (124, 126).
; PLAN: r0=479(x1), r1=75(y1), r2=124(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 75
LDI r2, 124
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
