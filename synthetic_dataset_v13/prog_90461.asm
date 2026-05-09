; DESCRIPTION: Draws a purple line from (480, 130) to (324, 40).
; PLAN: r0=480(x1), r1=130(y1), r2=324(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 130
LDI r2, 324
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
