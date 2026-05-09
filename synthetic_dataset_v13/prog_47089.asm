; DESCRIPTION: Places a blue line segment connecting (245, 27) to (85, 132).
; PLAN: r0=245(x1), r1=27(y1), r2=85(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 27
LDI r2, 85
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
