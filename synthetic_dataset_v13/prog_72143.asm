; DESCRIPTION: Places a cyan line segment connecting (486, 251) to (359, 135).
; PLAN: r0=486(x1), r1=251(y1), r2=359(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 251
LDI r2, 359
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
