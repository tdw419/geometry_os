; DESCRIPTION: Draws a red line from (265, 222) to (288, 21).
; PLAN: r0=265(x1), r1=222(y1), r2=288(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 222
LDI r2, 288
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
