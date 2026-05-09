; DESCRIPTION: Draws a white line from (334, 133) to (400, 192).
; PLAN: r0=334(x1), r1=133(y1), r2=400(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 133
LDI r2, 400
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
