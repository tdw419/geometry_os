; DESCRIPTION: Draws a orange line from (299, 220) to (455, 169).
; PLAN: r0=299(x1), r1=220(y1), r2=455(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 220
LDI r2, 455
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
