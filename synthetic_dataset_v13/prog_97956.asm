; DESCRIPTION: Draws a red line from (73, 103) to (31, 20).
; PLAN: r0=73(x1), r1=103(y1), r2=31(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 103
LDI r2, 31
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
