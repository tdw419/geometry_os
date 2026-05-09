; DESCRIPTION: Renders a blue line between points (280, 130) and (247, 51).
; PLAN: r0=280(x1), r1=130(y1), r2=247(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 130
LDI r2, 247
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
