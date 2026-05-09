; DESCRIPTION: Draws a yellow line from (300, 107) to (365, 246).
; PLAN: r0=300(x1), r1=107(y1), r2=365(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 107
LDI r2, 365
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
