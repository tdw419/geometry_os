; DESCRIPTION: Draws a orange line from (76, 96) to (69, 48).
; PLAN: r0=76(x1), r1=96(y1), r2=69(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 96
LDI r2, 69
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
