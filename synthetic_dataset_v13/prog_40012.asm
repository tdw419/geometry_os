; DESCRIPTION: Draws a white line from (364, 233) to (456, 227).
; PLAN: r0=364(x1), r1=233(y1), r2=456(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 233
LDI r2, 456
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
