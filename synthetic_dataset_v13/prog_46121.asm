; DESCRIPTION: Draws a blue line from (50, 107) to (145, 65).
; PLAN: r0=50(x1), r1=107(y1), r2=145(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 107
LDI r2, 145
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
