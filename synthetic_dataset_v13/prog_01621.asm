; DESCRIPTION: Draws a orange line from (297, 69) to (71, 178).
; PLAN: r0=297(x1), r1=69(y1), r2=71(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 69
LDI r2, 71
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
