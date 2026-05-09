; DESCRIPTION: Places a cyan line segment connecting (159, 49) to (112, 162).
; PLAN: r0=159(x1), r1=49(y1), r2=112(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 49
LDI r2, 112
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
