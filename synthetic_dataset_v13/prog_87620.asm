; DESCRIPTION: Places a cyan line segment connecting (31, 23) to (431, 219).
; PLAN: r0=31(x1), r1=23(y1), r2=431(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 23
LDI r2, 431
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
