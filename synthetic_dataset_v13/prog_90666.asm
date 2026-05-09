; DESCRIPTION: Draws a yellow line from (213, 41) to (85, 200).
; PLAN: r0=213(x1), r1=41(y1), r2=85(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 41
LDI r2, 85
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
