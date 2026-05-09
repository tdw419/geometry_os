; DESCRIPTION: Places a cyan line segment connecting (39, 110) to (159, 184).
; PLAN: r0=39(x1), r1=110(y1), r2=159(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 110
LDI r2, 159
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
