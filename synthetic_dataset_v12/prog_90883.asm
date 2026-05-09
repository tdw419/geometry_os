; DESCRIPTION: Places a cyan line segment connecting (218, 139) to (223, 119).
; PLAN: r0=218(x1), r1=139(y1), r2=223(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 139
LDI r2, 223
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
