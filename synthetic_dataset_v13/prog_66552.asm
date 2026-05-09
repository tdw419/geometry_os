; DESCRIPTION: Places a magenta line segment connecting (280, 139) to (106, 210).
; PLAN: r0=280(x1), r1=139(y1), r2=106(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 139
LDI r2, 106
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
