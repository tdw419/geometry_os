; DESCRIPTION: Places a yellow line segment connecting (140, 74) to (258, 143).
; PLAN: r0=140(x1), r1=74(y1), r2=258(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 74
LDI r2, 258
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
