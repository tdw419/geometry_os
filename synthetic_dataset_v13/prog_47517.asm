; DESCRIPTION: Places a cyan line segment connecting (100, 87) to (219, 161).
; PLAN: r0=100(x1), r1=87(y1), r2=219(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 87
LDI r2, 219
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
