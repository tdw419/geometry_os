; DESCRIPTION: Draws a red line from (367, 2) to (29, 191).
; PLAN: r0=367(x1), r1=2(y1), r2=29(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 2
LDI r2, 29
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
