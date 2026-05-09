; DESCRIPTION: Draws a white line from (227, 47) to (381, 16).
; PLAN: r0=227(x1), r1=47(y1), r2=381(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 47
LDI r2, 381
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
