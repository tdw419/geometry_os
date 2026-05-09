; DESCRIPTION: Places a green line segment connecting (95, 108) to (198, 211).
; PLAN: r0=95(x1), r1=108(y1), r2=198(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 108
LDI r2, 198
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
