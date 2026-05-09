; DESCRIPTION: Draws a white line from (43, 172) to (34, 128).
; PLAN: r0=43(x1), r1=172(y1), r2=34(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 172
LDI r2, 34
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
