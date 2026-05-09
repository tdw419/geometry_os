; DESCRIPTION: Places a cyan line segment connecting (27, 155) to (190, 156).
; PLAN: r0=27(x1), r1=155(y1), r2=190(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 155
LDI r2, 190
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
