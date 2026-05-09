; DESCRIPTION: Places a white line segment connecting (35, 190) to (192, 139).
; PLAN: r0=35(x1), r1=190(y1), r2=192(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 190
LDI r2, 192
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
