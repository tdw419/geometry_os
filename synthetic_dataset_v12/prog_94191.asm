; DESCRIPTION: Places a magenta line segment connecting (40, 130) to (103, 124).
; PLAN: r0=40(x1), r1=130(y1), r2=103(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 130
LDI r2, 103
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
