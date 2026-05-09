; DESCRIPTION: Draws a blue line from (132, 167) to (303, 28).
; PLAN: r0=132(x1), r1=167(y1), r2=303(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 167
LDI r2, 303
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
