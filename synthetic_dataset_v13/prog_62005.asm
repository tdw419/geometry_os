; DESCRIPTION: Places a blue line segment connecting (479, 241) to (55, 203).
; PLAN: r0=479(x1), r1=241(y1), r2=55(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 241
LDI r2, 55
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
