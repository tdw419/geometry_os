; DESCRIPTION: Composite: Renders a white line between points (379, 78) and (106, 180) then Places a cyan dot at position (249, 55).
; PLAN: r0=379(x1), r1=78(y1), r2=106(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=55(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 78
LDI r2, 106
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 55
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
