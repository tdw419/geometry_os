; DESCRIPTION: Draws a magenta line from (20, 130) to (396, 164).
; PLAN: r0=20(x1), r1=130(y1), r2=396(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 130
LDI r2, 396
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
