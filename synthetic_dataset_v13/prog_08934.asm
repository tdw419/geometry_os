; DESCRIPTION: Draws a blue line from (232, 209) to (487, 1).
; PLAN: r0=232(x1), r1=209(y1), r2=487(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 209
LDI r2, 487
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
