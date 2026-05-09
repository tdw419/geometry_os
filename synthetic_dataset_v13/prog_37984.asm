; DESCRIPTION: Places a yellow line segment connecting (57, 226) to (425, 118).
; PLAN: r0=57(x1), r1=226(y1), r2=425(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 226
LDI r2, 425
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
