; DESCRIPTION: Places a cyan line segment connecting (484, 19) to (276, 93).
; PLAN: r0=484(x1), r1=19(y1), r2=276(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 19
LDI r2, 276
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
