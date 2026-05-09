; DESCRIPTION: Draws a red line from (280, 200) to (278, 4).
; PLAN: r0=280(x1), r1=200(y1), r2=278(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 200
LDI r2, 278
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
