; DESCRIPTION: Draws a white line from (278, 118) to (8, 14).
; PLAN: r0=278(x1), r1=118(y1), r2=8(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 118
LDI r2, 8
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
