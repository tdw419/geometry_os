; DESCRIPTION: Draws a red line from (226, 215) to (368, 2).
; PLAN: r0=226(x1), r1=215(y1), r2=368(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 215
LDI r2, 368
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
