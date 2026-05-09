; DESCRIPTION: Places a magenta line segment connecting (80, 76) to (272, 253).
; PLAN: r0=80(x1), r1=76(y1), r2=272(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 76
LDI r2, 272
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
