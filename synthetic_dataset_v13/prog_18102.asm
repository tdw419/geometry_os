; DESCRIPTION: Draws a orange line from (7, 151) to (103, 193).
; PLAN: r0=7(x1), r1=151(y1), r2=103(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 151
LDI r2, 103
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
