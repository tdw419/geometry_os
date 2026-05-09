; DESCRIPTION: Renders a blue line between points (510, 50) and (280, 118).
; PLAN: r0=510(x1), r1=50(y1), r2=280(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 50
LDI r2, 280
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
