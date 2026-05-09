; DESCRIPTION: Composite: Renders a red line between points (207, 172) and (149, 134) then Sets a single white pixel at (107, 42).
; PLAN: r0=207(x1), r1=172(y1), r2=149(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=42(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 172
LDI r2, 149
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 42
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
