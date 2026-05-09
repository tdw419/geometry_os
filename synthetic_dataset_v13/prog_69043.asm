; DESCRIPTION: Renders a white line between points (442, 221) and (379, 41).
; PLAN: r0=442(x1), r1=221(y1), r2=379(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 221
LDI r2, 379
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
