; DESCRIPTION: Renders a red line between points (131, 52) and (298, 41).
; PLAN: r0=131(x1), r1=52(y1), r2=298(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 52
LDI r2, 298
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
