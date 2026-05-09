; DESCRIPTION: Places a cyan line segment connecting (345, 176) to (414, 190).
; PLAN: r0=345(x1), r1=176(y1), r2=414(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 176
LDI r2, 414
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
