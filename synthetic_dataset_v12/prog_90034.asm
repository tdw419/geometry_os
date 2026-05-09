; DESCRIPTION: Places a magenta line segment connecting (269, 77) to (225, 138).
; PLAN: r0=269(x1), r1=77(y1), r2=225(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 77
LDI r2, 225
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
