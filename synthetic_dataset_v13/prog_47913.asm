; DESCRIPTION: Draws a blue line from (370, 25) to (475, 104).
; PLAN: r0=370(x1), r1=25(y1), r2=475(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 25
LDI r2, 475
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
