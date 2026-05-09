; DESCRIPTION: Draws a green line from (171, 203) to (186, 150).
; PLAN: r0=171(x1), r1=203(y1), r2=186(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 203
LDI r2, 186
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
