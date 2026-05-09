; DESCRIPTION: Places a yellow line segment connecting (73, 158) to (417, 228).
; PLAN: r0=73(x1), r1=158(y1), r2=417(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 158
LDI r2, 417
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
