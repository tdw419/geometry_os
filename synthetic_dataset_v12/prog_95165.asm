; DESCRIPTION: Draws a white line from (27, 58) to (459, 105).
; PLAN: r0=27(x1), r1=58(y1), r2=459(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 58
LDI r2, 459
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
