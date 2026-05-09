; DESCRIPTION: Draws a white line from (291, 73) to (236, 159).
; PLAN: r0=291(x1), r1=73(y1), r2=236(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 73
LDI r2, 236
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
