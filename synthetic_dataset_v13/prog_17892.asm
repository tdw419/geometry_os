; DESCRIPTION: Renders a white line between points (380, 31) and (252, 81).
; PLAN: r0=380(x1), r1=31(y1), r2=252(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 31
LDI r2, 252
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
