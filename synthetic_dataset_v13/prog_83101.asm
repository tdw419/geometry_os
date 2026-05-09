; DESCRIPTION: Renders a green line between points (461, 130) and (169, 39).
; PLAN: r0=461(x1), r1=130(y1), r2=169(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 130
LDI r2, 169
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
