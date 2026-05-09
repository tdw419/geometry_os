; DESCRIPTION: Draws a blue line from (127, 10) to (237, 23).
; PLAN: r0=127(x1), r1=10(y1), r2=237(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 10
LDI r2, 237
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
