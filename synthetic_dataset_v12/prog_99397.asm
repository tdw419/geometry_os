; DESCRIPTION: Places a magenta line segment connecting (39, 199) to (195, 254).
; PLAN: r0=39(x1), r1=199(y1), r2=195(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 199
LDI r2, 195
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
