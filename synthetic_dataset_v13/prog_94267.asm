; DESCRIPTION: Draws a red line from (200, 205) to (274, 68).
; PLAN: r0=200(x1), r1=205(y1), r2=274(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 205
LDI r2, 274
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
