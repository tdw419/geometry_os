; DESCRIPTION: Draws a white line from (377, 57) to (415, 205).
; PLAN: r0=377(x1), r1=57(y1), r2=415(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 57
LDI r2, 415
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
