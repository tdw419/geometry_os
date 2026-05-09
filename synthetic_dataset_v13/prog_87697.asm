; DESCRIPTION: Draws a orange line from (234, 174) to (214, 162).
; PLAN: r0=234(x1), r1=174(y1), r2=214(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 174
LDI r2, 214
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
