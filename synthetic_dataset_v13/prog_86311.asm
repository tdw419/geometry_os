; DESCRIPTION: Draws a white line from (324, 86) to (141, 30).
; PLAN: r0=324(x1), r1=86(y1), r2=141(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 86
LDI r2, 141
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
