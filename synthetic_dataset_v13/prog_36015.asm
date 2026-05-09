; DESCRIPTION: Draws a red line from (407, 246) to (478, 213).
; PLAN: r0=407(x1), r1=246(y1), r2=478(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 246
LDI r2, 478
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
