; DESCRIPTION: Places a blue line segment connecting (272, 254) to (65, 186).
; PLAN: r0=272(x1), r1=254(y1), r2=65(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 254
LDI r2, 65
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
