; DESCRIPTION: Draws a red line from (396, 107) to (177, 171).
; PLAN: r0=396(x1), r1=107(y1), r2=177(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 107
LDI r2, 177
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
