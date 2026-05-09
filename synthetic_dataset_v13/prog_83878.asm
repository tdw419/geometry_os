; DESCRIPTION: Draws a white line from (332, 168) to (37, 105).
; PLAN: r0=332(x1), r1=168(y1), r2=37(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 168
LDI r2, 37
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
