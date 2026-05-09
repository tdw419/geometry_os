; DESCRIPTION: Draws a red line from (407, 70) to (240, 99).
; PLAN: r0=407(x1), r1=70(y1), r2=240(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 70
LDI r2, 240
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
