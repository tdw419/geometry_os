; DESCRIPTION: Renders a magenta line between points (31, 59) and (309, 49).
; PLAN: r0=31(x1), r1=59(y1), r2=309(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 59
LDI r2, 309
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
