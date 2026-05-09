; DESCRIPTION: Draws a black line from (123, 160) to (482, 214).
; PLAN: r0=123(x1), r1=160(y1), r2=482(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 160
LDI r2, 482
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
