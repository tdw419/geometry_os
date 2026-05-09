; DESCRIPTION: Draws a white line from (270, 56) to (240, 106).
; PLAN: r0=270(x1), r1=56(y1), r2=240(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 56
LDI r2, 240
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
