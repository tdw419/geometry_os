; DESCRIPTION: Renders a black line between points (143, 242) and (103, 41).
; PLAN: r0=143(x1), r1=242(y1), r2=103(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 242
LDI r2, 103
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
