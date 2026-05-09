; DESCRIPTION: Draws a red line from (338, 237) to (8, 62).
; PLAN: r0=338(x1), r1=237(y1), r2=8(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 237
LDI r2, 8
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
