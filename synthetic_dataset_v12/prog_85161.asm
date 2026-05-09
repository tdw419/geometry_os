; DESCRIPTION: Renders a magenta line between points (383, 188) and (455, 243).
; PLAN: r0=383(x1), r1=188(y1), r2=455(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 188
LDI r2, 455
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
