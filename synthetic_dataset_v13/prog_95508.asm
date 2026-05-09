; DESCRIPTION: Draws a white line from (141, 66) to (8, 38).
; PLAN: r0=141(x1), r1=66(y1), r2=8(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 66
LDI r2, 8
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
