; DESCRIPTION: Draws a orange line from (154, 78) to (38, 56).
; PLAN: r0=154(x1), r1=78(y1), r2=38(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 78
LDI r2, 38
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
