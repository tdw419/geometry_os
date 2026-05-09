; DESCRIPTION: Draws a white line from (287, 0) to (4, 90).
; PLAN: r0=287(x1), r1=0(y1), r2=4(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 0
LDI r2, 4
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
