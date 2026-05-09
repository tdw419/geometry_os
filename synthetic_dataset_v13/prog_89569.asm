; DESCRIPTION: Draws a black line from (314, 36) to (114, 215).
; PLAN: r0=314(x1), r1=36(y1), r2=114(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 36
LDI r2, 114
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
