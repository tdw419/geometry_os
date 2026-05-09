; DESCRIPTION: Places a green line segment connecting (145, 130) to (68, 43).
; PLAN: r0=145(x1), r1=130(y1), r2=68(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 130
LDI r2, 68
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
