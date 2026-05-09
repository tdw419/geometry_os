; DESCRIPTION: Places a green line segment connecting (399, 138) to (145, 65).
; PLAN: r0=399(x1), r1=138(y1), r2=145(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 138
LDI r2, 145
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
