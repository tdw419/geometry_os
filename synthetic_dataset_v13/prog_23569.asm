; DESCRIPTION: Draws a red line from (165, 249) to (124, 246).
; PLAN: r0=165(x1), r1=249(y1), r2=124(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 249
LDI r2, 124
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
