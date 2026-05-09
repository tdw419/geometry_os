; DESCRIPTION: Places a green line segment connecting (272, 184) to (447, 180).
; PLAN: r0=272(x1), r1=184(y1), r2=447(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 184
LDI r2, 447
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
