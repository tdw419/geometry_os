; DESCRIPTION: Renders a yellow line between points (131, 0) and (510, 99).
; PLAN: r0=131(x1), r1=0(y1), r2=510(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 0
LDI r2, 510
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
