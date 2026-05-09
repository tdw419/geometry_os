; DESCRIPTION: Places a cyan line segment connecting (60, 184) to (382, 105).
; PLAN: r0=60(x1), r1=184(y1), r2=382(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 184
LDI r2, 382
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
