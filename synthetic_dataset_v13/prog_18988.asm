; DESCRIPTION: Draws a blue line from (462, 58) to (492, 40).
; PLAN: r0=462(x1), r1=58(y1), r2=492(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 58
LDI r2, 492
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
