; DESCRIPTION: Draws a white line from (230, 176) to (54, 189).
; PLAN: r0=230(x1), r1=176(y1), r2=54(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 176
LDI r2, 54
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
