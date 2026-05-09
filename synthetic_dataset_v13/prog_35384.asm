; DESCRIPTION: Places a cyan line segment connecting (85, 176) to (48, 145).
; PLAN: r0=85(x1), r1=176(y1), r2=48(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 176
LDI r2, 48
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
