; DESCRIPTION: Draws a orange line from (330, 204) to (450, 72).
; PLAN: r0=330(x1), r1=204(y1), r2=450(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 204
LDI r2, 450
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
