; DESCRIPTION: Places a cyan line segment connecting (307, 184) to (338, 251).
; PLAN: r0=307(x1), r1=184(y1), r2=338(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 184
LDI r2, 338
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
