; DESCRIPTION: Draws a blue line from (368, 50) to (375, 19).
; PLAN: r0=368(x1), r1=50(y1), r2=375(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 50
LDI r2, 375
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
