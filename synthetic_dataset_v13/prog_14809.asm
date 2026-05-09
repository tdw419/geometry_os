; DESCRIPTION: Places a cyan line segment connecting (112, 238) to (159, 7).
; PLAN: r0=112(x1), r1=238(y1), r2=159(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 238
LDI r2, 159
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
