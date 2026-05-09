; DESCRIPTION: Renders a red line between points (383, 216) and (111, 87).
; PLAN: r0=383(x1), r1=216(y1), r2=111(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 216
LDI r2, 111
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
