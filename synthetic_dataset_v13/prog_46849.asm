; DESCRIPTION: Draws a white line from (253, 58) to (428, 3).
; PLAN: r0=253(x1), r1=58(y1), r2=428(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 58
LDI r2, 428
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
