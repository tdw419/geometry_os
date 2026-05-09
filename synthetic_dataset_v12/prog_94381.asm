; DESCRIPTION: Draws a yellow line from (138, 41) to (293, 71).
; PLAN: r0=138(x1), r1=41(y1), r2=293(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 41
LDI r2, 293
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
