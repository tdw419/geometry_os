; DESCRIPTION: Draws a orange line from (121, 129) to (91, 237).
; PLAN: r0=121(x1), r1=129(y1), r2=91(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 129
LDI r2, 91
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
