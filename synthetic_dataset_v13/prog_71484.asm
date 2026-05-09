; DESCRIPTION: Draws a black line from (36, 121) to (406, 67).
; PLAN: r0=36(x1), r1=121(y1), r2=406(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 121
LDI r2, 406
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
