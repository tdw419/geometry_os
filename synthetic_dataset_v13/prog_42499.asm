; DESCRIPTION: Draws a red line from (117, 43) to (10, 132).
; PLAN: r0=117(x1), r1=43(y1), r2=10(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 43
LDI r2, 10
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
