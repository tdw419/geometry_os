; DESCRIPTION: Places a magenta line segment connecting (499, 177) to (381, 139).
; PLAN: r0=499(x1), r1=177(y1), r2=381(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 177
LDI r2, 381
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
