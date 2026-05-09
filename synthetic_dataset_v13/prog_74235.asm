; DESCRIPTION: Renders a blue line between points (307, 162) and (121, 247).
; PLAN: r0=307(x1), r1=162(y1), r2=121(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 162
LDI r2, 121
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
