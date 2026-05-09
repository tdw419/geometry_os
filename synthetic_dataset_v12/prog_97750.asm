; DESCRIPTION: Places a cyan line segment connecting (349, 184) to (244, 9).
; PLAN: r0=349(x1), r1=184(y1), r2=244(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 184
LDI r2, 244
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
