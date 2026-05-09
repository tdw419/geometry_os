; DESCRIPTION: Draws a white line from (399, 103) to (185, 230).
; PLAN: r0=399(x1), r1=103(y1), r2=185(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 103
LDI r2, 185
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
