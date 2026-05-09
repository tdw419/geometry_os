; DESCRIPTION: Draws a blue line from (367, 163) to (25, 40).
; PLAN: r0=367(x1), r1=163(y1), r2=25(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 163
LDI r2, 25
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
