; DESCRIPTION: Renders a white line between points (57, 187) and (126, 41).
; PLAN: r0=57(x1), r1=187(y1), r2=126(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 187
LDI r2, 126
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
