; DESCRIPTION: Draws a red line from (185, 249) to (458, 226).
; PLAN: r0=185(x1), r1=249(y1), r2=458(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 249
LDI r2, 458
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
