; DESCRIPTION: Places a red line segment connecting (492, 132) to (184, 238).
; PLAN: r0=492(x1), r1=132(y1), r2=184(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 132
LDI r2, 184
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
