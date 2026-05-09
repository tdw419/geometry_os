; DESCRIPTION: Draws a orange line from (256, 60) to (96, 46).
; PLAN: r0=256(x1), r1=60(y1), r2=96(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 60
LDI r2, 96
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
