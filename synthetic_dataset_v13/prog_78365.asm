; DESCRIPTION: Places a cyan line segment connecting (208, 145) to (21, 218).
; PLAN: r0=208(x1), r1=145(y1), r2=21(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 145
LDI r2, 21
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
