; DESCRIPTION: Draws a orange line from (191, 187) to (288, 182).
; PLAN: r0=191(x1), r1=187(y1), r2=288(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 187
LDI r2, 288
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
