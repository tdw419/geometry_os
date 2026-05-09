; DESCRIPTION: Draws a black line from (330, 113) to (182, 99).
; PLAN: r0=330(x1), r1=113(y1), r2=182(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 113
LDI r2, 182
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
