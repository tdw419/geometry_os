; DESCRIPTION: Draws a white line from (385, 85) to (144, 88).
; PLAN: r0=385(x1), r1=85(y1), r2=144(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 85
LDI r2, 144
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
