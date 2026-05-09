; DESCRIPTION: Draws a blue line from (256, 115) to (338, 33).
; PLAN: r0=256(x1), r1=115(y1), r2=338(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 115
LDI r2, 338
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
