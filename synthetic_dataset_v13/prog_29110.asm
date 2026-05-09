; DESCRIPTION: Draws a white line from (53, 20) to (189, 179).
; PLAN: r0=53(x1), r1=20(y1), r2=189(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 20
LDI r2, 189
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
