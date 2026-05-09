; DESCRIPTION: Places a white line segment connecting (218, 238) to (6, 190).
; PLAN: r0=218(x1), r1=238(y1), r2=6(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 238
LDI r2, 6
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
