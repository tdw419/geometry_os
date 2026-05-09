; DESCRIPTION: Draws a white line from (415, 161) to (204, 132).
; PLAN: r0=415(x1), r1=161(y1), r2=204(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 161
LDI r2, 204
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
