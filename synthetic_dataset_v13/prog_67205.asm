; DESCRIPTION: Places a cyan line segment connecting (438, 218) to (270, 180).
; PLAN: r0=438(x1), r1=218(y1), r2=270(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 218
LDI r2, 270
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
