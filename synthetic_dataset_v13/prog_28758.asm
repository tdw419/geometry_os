; DESCRIPTION: Draws a red line from (252, 11) to (144, 237).
; PLAN: r0=252(x1), r1=11(y1), r2=144(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 11
LDI r2, 144
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
