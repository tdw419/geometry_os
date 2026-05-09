; DESCRIPTION: Places a cyan line segment connecting (15, 99) to (299, 218).
; PLAN: r0=15(x1), r1=99(y1), r2=299(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 99
LDI r2, 299
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
