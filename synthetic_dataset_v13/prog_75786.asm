; DESCRIPTION: Draws a black line from (117, 94) to (74, 92).
; PLAN: r0=117(x1), r1=94(y1), r2=74(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 94
LDI r2, 74
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
