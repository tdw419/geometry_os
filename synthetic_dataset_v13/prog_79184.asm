; DESCRIPTION: Renders a black line between points (367, 135) and (41, 173).
; PLAN: r0=367(x1), r1=135(y1), r2=41(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 135
LDI r2, 41
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
