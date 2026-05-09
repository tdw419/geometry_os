; DESCRIPTION: Composite: Renders a white line between points (30, 120) and (138, 123) then Places a white dot at position (437, 116).
; PLAN: r0=30(x1), r1=120(y1), r2=138(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=116(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 120
LDI r2, 138
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 116
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
