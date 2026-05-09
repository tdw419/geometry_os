; DESCRIPTION: Draws a orange line from (1, 209) to (142, 193).
; PLAN: r0=1(x1), r1=209(y1), r2=142(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 209
LDI r2, 142
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
