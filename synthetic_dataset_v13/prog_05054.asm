; DESCRIPTION: Places a green line segment connecting (443, 158) to (39, 242).
; PLAN: r0=443(x1), r1=158(y1), r2=39(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 158
LDI r2, 39
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
