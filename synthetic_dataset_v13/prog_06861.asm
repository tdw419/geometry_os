; DESCRIPTION: Places a green line segment connecting (170, 143) to (24, 255).
; PLAN: r0=170(x1), r1=143(y1), r2=24(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 143
LDI r2, 24
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
