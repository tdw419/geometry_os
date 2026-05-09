; DESCRIPTION: Places a cyan line segment connecting (318, 200) to (248, 180).
; PLAN: r0=318(x1), r1=200(y1), r2=248(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 200
LDI r2, 248
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
