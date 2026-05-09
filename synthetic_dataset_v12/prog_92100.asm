; DESCRIPTION: Renders a white line between points (98, 9) and (275, 41).
; PLAN: r0=98(x1), r1=9(y1), r2=275(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 9
LDI r2, 275
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
