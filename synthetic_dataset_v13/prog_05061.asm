; DESCRIPTION: Places a yellow line segment connecting (216, 195) to (44, 83).
; PLAN: r0=216(x1), r1=195(y1), r2=44(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 195
LDI r2, 44
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
