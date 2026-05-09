; DESCRIPTION: Draws a white line from (86, 81) to (61, 189).
; PLAN: r0=86(x1), r1=81(y1), r2=61(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 81
LDI r2, 61
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
