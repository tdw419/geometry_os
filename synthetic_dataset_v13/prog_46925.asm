; DESCRIPTION: Draws a orange line from (222, 120) to (453, 210).
; PLAN: r0=222(x1), r1=120(y1), r2=453(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 120
LDI r2, 453
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
