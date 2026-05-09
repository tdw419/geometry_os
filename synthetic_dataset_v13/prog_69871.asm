; DESCRIPTION: Draws a white line from (133, 115) to (21, 124).
; PLAN: r0=133(x1), r1=115(y1), r2=21(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 115
LDI r2, 21
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
