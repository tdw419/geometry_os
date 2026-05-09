; DESCRIPTION: Places a cyan line segment connecting (430, 81) to (349, 115).
; PLAN: r0=430(x1), r1=81(y1), r2=349(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 81
LDI r2, 349
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
