; DESCRIPTION: Renders a yellow line between points (36, 41) and (284, 84).
; PLAN: r0=36(x1), r1=41(y1), r2=284(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 41
LDI r2, 284
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
