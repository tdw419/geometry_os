; DESCRIPTION: Draws a green line from (434, 249) to (314, 100).
; PLAN: r0=434(x1), r1=249(y1), r2=314(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 249
LDI r2, 314
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
