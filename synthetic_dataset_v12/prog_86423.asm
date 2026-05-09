; DESCRIPTION: Renders a magenta line between points (474, 130) and (254, 216).
; PLAN: r0=474(x1), r1=130(y1), r2=254(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 130
LDI r2, 254
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
