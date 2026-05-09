; DESCRIPTION: Draws a red line from (5, 202) to (361, 37).
; PLAN: r0=5(x1), r1=202(y1), r2=361(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 202
LDI r2, 361
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
