; DESCRIPTION: Draws a red line from (141, 204) to (375, 19).
; PLAN: r0=141(x1), r1=204(y1), r2=375(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 204
LDI r2, 375
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
