; DESCRIPTION: Places a purple line segment connecting (64, 243) to (275, 63).
; PLAN: r0=64(x1), r1=243(y1), r2=275(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 243
LDI r2, 275
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
