; DESCRIPTION: Draws a white line from (121, 251) to (329, 12).
; PLAN: r0=121(x1), r1=251(y1), r2=329(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 251
LDI r2, 329
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
