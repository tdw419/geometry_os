; DESCRIPTION: Renders a magenta line between points (40, 15) and (499, 238).
; PLAN: r0=40(x1), r1=15(y1), r2=499(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 15
LDI r2, 499
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
