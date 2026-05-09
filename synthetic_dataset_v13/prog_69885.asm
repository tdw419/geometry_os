; DESCRIPTION: Draws a orange line from (243, 105) to (434, 7).
; PLAN: r0=243(x1), r1=105(y1), r2=434(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 105
LDI r2, 434
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
