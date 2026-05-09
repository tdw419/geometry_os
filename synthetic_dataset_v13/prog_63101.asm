; DESCRIPTION: Places a green line segment connecting (134, 39) to (192, 82).
; PLAN: r0=134(x1), r1=39(y1), r2=192(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 39
LDI r2, 192
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
