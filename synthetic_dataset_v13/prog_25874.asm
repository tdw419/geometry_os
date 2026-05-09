; DESCRIPTION: Renders a magenta line between points (0, 130) and (374, 237).
; PLAN: r0=0(x1), r1=130(y1), r2=374(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 130
LDI r2, 374
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
