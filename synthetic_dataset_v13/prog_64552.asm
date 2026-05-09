; DESCRIPTION: Renders a magenta line between points (430, 130) and (18, 39).
; PLAN: r0=430(x1), r1=130(y1), r2=18(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 130
LDI r2, 18
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
