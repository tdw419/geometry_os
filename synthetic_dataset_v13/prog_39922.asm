; DESCRIPTION: Places a cyan line segment connecting (419, 32) to (470, 78).
; PLAN: r0=419(x1), r1=32(y1), r2=470(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 32
LDI r2, 470
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
