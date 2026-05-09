; DESCRIPTION: Draws a black line from (399, 103) to (312, 117).
; PLAN: r0=399(x1), r1=103(y1), r2=312(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 103
LDI r2, 312
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
