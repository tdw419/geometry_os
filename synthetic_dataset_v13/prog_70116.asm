; DESCRIPTION: Draws a red line from (361, 15) to (426, 210).
; PLAN: r0=361(x1), r1=15(y1), r2=426(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 15
LDI r2, 426
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
