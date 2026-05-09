; DESCRIPTION: Draws a blue line from (332, 48) to (8, 19).
; PLAN: r0=332(x1), r1=48(y1), r2=8(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 48
LDI r2, 8
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
