; DESCRIPTION: Draws a red line from (280, 91) to (359, 3).
; PLAN: r0=280(x1), r1=91(y1), r2=359(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 91
LDI r2, 359
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
