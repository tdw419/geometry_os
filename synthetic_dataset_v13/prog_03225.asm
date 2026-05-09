; DESCRIPTION: Draws a white line from (101, 90) to (278, 180).
; PLAN: r0=101(x1), r1=90(y1), r2=278(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 90
LDI r2, 278
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
