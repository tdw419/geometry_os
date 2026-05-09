; DESCRIPTION: Places a blue line segment connecting (479, 149) to (244, 209).
; PLAN: r0=479(x1), r1=149(y1), r2=244(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 149
LDI r2, 244
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
