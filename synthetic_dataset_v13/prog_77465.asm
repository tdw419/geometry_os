; DESCRIPTION: Places a green line segment connecting (342, 27) to (190, 73).
; PLAN: r0=342(x1), r1=27(y1), r2=190(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 27
LDI r2, 190
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
