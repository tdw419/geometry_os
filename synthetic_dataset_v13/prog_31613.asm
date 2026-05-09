; DESCRIPTION: Draws a green line from (404, 107) to (427, 121).
; PLAN: r0=404(x1), r1=107(y1), r2=427(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 107
LDI r2, 427
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
