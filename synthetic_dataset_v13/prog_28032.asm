; DESCRIPTION: Places a cyan line segment connecting (314, 47) to (81, 199).
; PLAN: r0=314(x1), r1=47(y1), r2=81(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 47
LDI r2, 81
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
