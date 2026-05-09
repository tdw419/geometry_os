; DESCRIPTION: Renders a green line between points (381, 60) and (510, 118).
; PLAN: r0=381(x1), r1=60(y1), r2=510(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 60
LDI r2, 510
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
