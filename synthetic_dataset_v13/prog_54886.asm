; DESCRIPTION: Draws a orange line from (243, 166) to (288, 54).
; PLAN: r0=243(x1), r1=166(y1), r2=288(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 166
LDI r2, 288
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
