; DESCRIPTION: Draws a magenta line from (112, 130) to (291, 20).
; PLAN: r0=112(x1), r1=130(y1), r2=291(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 130
LDI r2, 291
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
