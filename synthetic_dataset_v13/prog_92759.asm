; DESCRIPTION: Places a green line segment connecting (479, 14) to (96, 244).
; PLAN: r0=479(x1), r1=14(y1), r2=96(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 14
LDI r2, 96
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
