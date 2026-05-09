; DESCRIPTION: Renders a white line between points (79, 111) and (150, 41).
; PLAN: r0=79(x1), r1=111(y1), r2=150(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 111
LDI r2, 150
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
