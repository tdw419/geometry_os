; DESCRIPTION: Draws a blue line from (88, 127) to (11, 86).
; PLAN: r0=88(x1), r1=127(y1), r2=11(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 127
LDI r2, 11
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
