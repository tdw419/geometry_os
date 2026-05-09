; DESCRIPTION: Renders a white line between points (410, 71) and (134, 73).
; PLAN: r0=410(x1), r1=71(y1), r2=134(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 71
LDI r2, 134
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
