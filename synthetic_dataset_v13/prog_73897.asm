; DESCRIPTION: Draws a blue line from (354, 25) to (458, 162).
; PLAN: r0=354(x1), r1=25(y1), r2=458(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 25
LDI r2, 458
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
