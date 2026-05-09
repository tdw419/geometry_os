; DESCRIPTION: Places a magenta line segment connecting (213, 226) to (90, 139).
; PLAN: r0=213(x1), r1=226(y1), r2=90(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 226
LDI r2, 90
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
