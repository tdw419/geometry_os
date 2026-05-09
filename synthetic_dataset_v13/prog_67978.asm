; DESCRIPTION: Draws a red line from (276, 237) to (153, 87).
; PLAN: r0=276(x1), r1=237(y1), r2=153(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 237
LDI r2, 153
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
