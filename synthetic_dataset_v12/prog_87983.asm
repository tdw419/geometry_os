; DESCRIPTION: Draws a orange line from (207, 249) to (434, 121).
; PLAN: r0=207(x1), r1=249(y1), r2=434(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 249
LDI r2, 434
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
