; DESCRIPTION: Draws a white line from (338, 73) to (247, 129).
; PLAN: r0=338(x1), r1=73(y1), r2=247(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 73
LDI r2, 247
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
