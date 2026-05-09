; DESCRIPTION: Places a blue line segment connecting (417, 84) to (479, 107).
; PLAN: r0=417(x1), r1=84(y1), r2=479(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 84
LDI r2, 479
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
