; DESCRIPTION: Renders a blue line between points (461, 130) and (440, 91).
; PLAN: r0=461(x1), r1=130(y1), r2=440(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 130
LDI r2, 440
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
