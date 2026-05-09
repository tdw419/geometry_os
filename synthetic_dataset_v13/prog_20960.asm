; DESCRIPTION: Places a red circle of radius 41 at center (198, 203).
; PLAN: r0=198(x), r1=203(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 203
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
