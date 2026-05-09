; DESCRIPTION: Places a yellow line segment connecting (208, 12) to (182, 190).
; PLAN: r0=208(x1), r1=12(y1), r2=182(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 12
LDI r2, 182
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
