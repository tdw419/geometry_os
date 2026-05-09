; DESCRIPTION: Draws a yellow line from (495, 2) to (292, 83).
; PLAN: r0=495(x1), r1=2(y1), r2=292(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 2
LDI r2, 292
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
