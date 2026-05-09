; DESCRIPTION: Draws a purple line from (168, 18) to (480, 130).
; PLAN: r0=168(x1), r1=18(y1), r2=480(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 480
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
