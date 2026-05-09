; DESCRIPTION: Composite: Renders a white line between points (507, 59) and (437, 91) then Places a blue dot at position (109, 162).
; PLAN: r0=507(x1), r1=59(y1), r2=437(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=162(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 507
LDI r1, 59
LDI r2, 437
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 162
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
