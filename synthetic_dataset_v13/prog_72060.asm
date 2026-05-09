; DESCRIPTION: Draws a red line from (144, 247) to (194, 237).
; PLAN: r0=144(x1), r1=247(y1), r2=194(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 247
LDI r2, 194
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
