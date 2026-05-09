; DESCRIPTION: Draws a white line from (495, 118) to (249, 103).
; PLAN: r0=495(x1), r1=118(y1), r2=249(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 118
LDI r2, 249
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
