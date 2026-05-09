; DESCRIPTION: Places a magenta line segment connecting (110, 59) to (279, 82).
; PLAN: r0=110(x1), r1=59(y1), r2=279(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 59
LDI r2, 279
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
