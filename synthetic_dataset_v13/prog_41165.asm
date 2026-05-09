; DESCRIPTION: Draws a blue line from (358, 130) to (430, 215).
; PLAN: r0=358(x1), r1=130(y1), r2=430(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 130
LDI r2, 430
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
