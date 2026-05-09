; DESCRIPTION: Draws a orange line from (364, 50) to (202, 136).
; PLAN: r0=364(x1), r1=50(y1), r2=202(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 50
LDI r2, 202
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
