; DESCRIPTION: Draws a red line from (338, 194) to (237, 54).
; PLAN: r0=338(x1), r1=194(y1), r2=237(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 194
LDI r2, 237
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
