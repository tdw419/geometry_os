; DESCRIPTION: Draws a white line from (36, 143) to (247, 43).
; PLAN: r0=36(x1), r1=143(y1), r2=247(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 143
LDI r2, 247
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
