; DESCRIPTION: Draws a red line from (331, 84) to (462, 240).
; PLAN: r0=331(x1), r1=84(y1), r2=462(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 84
LDI r2, 462
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
