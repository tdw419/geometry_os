; DESCRIPTION: Draws a blue line from (222, 71) to (350, 95).
; PLAN: r0=222(x1), r1=71(y1), r2=350(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 71
LDI r2, 350
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
