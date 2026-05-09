; DESCRIPTION: Draws a red line from (241, 73) to (465, 99).
; PLAN: r0=241(x1), r1=73(y1), r2=465(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 73
LDI r2, 465
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
