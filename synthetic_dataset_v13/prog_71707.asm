; DESCRIPTION: Draws a red line from (358, 189) to (368, 209).
; PLAN: r0=358(x1), r1=189(y1), r2=368(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 189
LDI r2, 368
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
