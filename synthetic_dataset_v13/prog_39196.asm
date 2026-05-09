; DESCRIPTION: Renders a red line between points (362, 31) and (493, 194).
; PLAN: r0=362(x1), r1=31(y1), r2=493(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 31
LDI r2, 493
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
