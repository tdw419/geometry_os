; DESCRIPTION: Draws a orange line from (96, 193) to (256, 25).
; PLAN: r0=96(x1), r1=193(y1), r2=256(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 193
LDI r2, 256
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
