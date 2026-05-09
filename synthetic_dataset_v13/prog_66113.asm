; DESCRIPTION: Draws a white line from (54, 133) to (303, 204).
; PLAN: r0=54(x1), r1=133(y1), r2=303(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 133
LDI r2, 303
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
