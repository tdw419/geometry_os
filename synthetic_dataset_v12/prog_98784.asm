; DESCRIPTION: Draws a blue line from (280, 86) to (334, 132).
; PLAN: r0=280(x1), r1=86(y1), r2=334(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 86
LDI r2, 334
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
