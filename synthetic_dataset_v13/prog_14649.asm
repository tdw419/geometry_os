; DESCRIPTION: Places a cyan line segment connecting (396, 74) to (251, 9).
; PLAN: r0=396(x1), r1=74(y1), r2=251(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 74
LDI r2, 251
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
