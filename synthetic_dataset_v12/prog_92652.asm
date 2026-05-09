; DESCRIPTION: Draws a red line from (415, 216) to (40, 18).
; PLAN: r0=415(x1), r1=216(y1), r2=40(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 216
LDI r2, 40
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
