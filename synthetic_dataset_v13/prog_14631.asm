; DESCRIPTION: Renders a white line between points (18, 41) and (167, 8).
; PLAN: r0=18(x1), r1=41(y1), r2=167(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 41
LDI r2, 167
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
