; DESCRIPTION: Renders a green line between points (3, 41) and (298, 1).
; PLAN: r0=3(x1), r1=41(y1), r2=298(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 41
LDI r2, 298
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
