; DESCRIPTION: Draws a red line from (117, 135) to (385, 3).
; PLAN: r0=117(x1), r1=135(y1), r2=385(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 135
LDI r2, 385
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
