; DESCRIPTION: Places a blue line segment connecting (479, 80) to (172, 59).
; PLAN: r0=479(x1), r1=80(y1), r2=172(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 80
LDI r2, 172
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
