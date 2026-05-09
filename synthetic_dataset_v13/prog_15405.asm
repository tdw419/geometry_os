; DESCRIPTION: Draws a black line from (284, 92) to (314, 161).
; PLAN: r0=284(x1), r1=92(y1), r2=314(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 92
LDI r2, 314
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
