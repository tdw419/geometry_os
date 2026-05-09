; DESCRIPTION: Draws a white line from (469, 47) to (459, 188).
; PLAN: r0=469(x1), r1=47(y1), r2=459(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 47
LDI r2, 459
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
