; DESCRIPTION: Draws a blue line from (332, 61) to (370, 33).
; PLAN: r0=332(x1), r1=61(y1), r2=370(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 61
LDI r2, 370
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
