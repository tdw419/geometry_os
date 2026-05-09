; DESCRIPTION: Places a green line segment connecting (272, 115) to (141, 243).
; PLAN: r0=272(x1), r1=115(y1), r2=141(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 115
LDI r2, 141
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
