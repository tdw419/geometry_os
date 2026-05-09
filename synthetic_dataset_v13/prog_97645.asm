; DESCRIPTION: Places a cyan line segment connecting (322, 11) to (190, 205).
; PLAN: r0=322(x1), r1=11(y1), r2=190(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 11
LDI r2, 190
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
