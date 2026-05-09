; DESCRIPTION: Places a magenta line segment connecting (499, 29) to (106, 114).
; PLAN: r0=499(x1), r1=29(y1), r2=106(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 29
LDI r2, 106
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
