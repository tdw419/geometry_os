; DESCRIPTION: Places a magenta line segment connecting (3, 114) to (272, 55).
; PLAN: r0=3(x1), r1=114(y1), r2=272(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 114
LDI r2, 272
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
