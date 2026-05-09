; DESCRIPTION: Places a green line segment connecting (403, 86) to (383, 211).
; PLAN: r0=403(x1), r1=86(y1), r2=383(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 86
LDI r2, 383
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
