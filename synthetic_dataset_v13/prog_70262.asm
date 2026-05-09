; DESCRIPTION: Draws a red line from (136, 233) to (231, 209).
; PLAN: r0=136(x1), r1=233(y1), r2=231(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 233
LDI r2, 231
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
