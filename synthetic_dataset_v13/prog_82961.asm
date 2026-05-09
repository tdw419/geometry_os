; DESCRIPTION: Renders a blue line between points (455, 130) and (303, 206).
; PLAN: r0=455(x1), r1=130(y1), r2=303(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 130
LDI r2, 303
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
