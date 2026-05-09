; DESCRIPTION: Places a cyan line segment connecting (178, 232) to (353, 218).
; PLAN: r0=178(x1), r1=232(y1), r2=353(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 232
LDI r2, 353
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
