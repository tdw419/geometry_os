; DESCRIPTION: Places a green line segment connecting (479, 10) to (119, 223).
; PLAN: r0=479(x1), r1=10(y1), r2=119(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 10
LDI r2, 119
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
