; DESCRIPTION: Places a cyan line segment connecting (253, 248) to (190, 149).
; PLAN: r0=253(x1), r1=248(y1), r2=190(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 248
LDI r2, 190
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
