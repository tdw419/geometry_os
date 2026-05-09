; DESCRIPTION: Renders a magenta line between points (510, 115) and (101, 199).
; PLAN: r0=510(x1), r1=115(y1), r2=101(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 115
LDI r2, 101
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
