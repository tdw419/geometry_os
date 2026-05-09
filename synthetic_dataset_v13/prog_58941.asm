; DESCRIPTION: Draws a red line from (367, 200) to (424, 230).
; PLAN: r0=367(x1), r1=200(y1), r2=424(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 200
LDI r2, 424
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
