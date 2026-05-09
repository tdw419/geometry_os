; DESCRIPTION: Places a cyan line segment connecting (232, 168) to (14, 218).
; PLAN: r0=232(x1), r1=168(y1), r2=14(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 168
LDI r2, 14
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
