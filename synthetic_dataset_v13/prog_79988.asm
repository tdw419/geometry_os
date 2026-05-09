; DESCRIPTION: Draws a green line from (171, 160) to (336, 22).
; PLAN: r0=171(x1), r1=160(y1), r2=336(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 160
LDI r2, 336
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
