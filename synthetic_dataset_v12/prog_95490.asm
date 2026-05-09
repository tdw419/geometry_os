; DESCRIPTION: Draws a yellow line from (129, 89) to (488, 27).
; PLAN: r0=129(x1), r1=89(y1), r2=488(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 89
LDI r2, 488
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
