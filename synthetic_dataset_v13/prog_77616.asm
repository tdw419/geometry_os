; DESCRIPTION: Composite: Renders a red line between points (113, 61) and (229, 28) then Places a white dot at position (87, 189).
; PLAN: r0=113(x1), r1=61(y1), r2=229(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=189(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 113
LDI r1, 61
LDI r2, 229
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 189
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
