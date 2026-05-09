; DESCRIPTION: Draws a green line from (495, 100) to (491, 3).
; PLAN: r0=495(x1), r1=100(y1), r2=491(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 100
LDI r2, 491
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
