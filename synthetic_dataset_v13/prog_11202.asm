; DESCRIPTION: Places a yellow line segment connecting (238, 179) to (12, 228).
; PLAN: r0=238(x1), r1=179(y1), r2=12(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 179
LDI r2, 12
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
