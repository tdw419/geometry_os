; DESCRIPTION: Draws a blue line from (370, 203) to (211, 164).
; PLAN: r0=370(x1), r1=203(y1), r2=211(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 203
LDI r2, 211
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
