; DESCRIPTION: Composite: Creates a white rectangular region at (105, 11) spanning 37 by 74 pixels then Renders a red line between points (437, 150) and (331, 140) then Places a white dot at position (177, 131).
; PLAN: r0=105(x), r1=11(y), r2=37(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=150(y1), r7=331(x2), r8=140(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=131(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 11
LDI r2, 37
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 150
LDI r7, 331
LDI r8, 140
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 131
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
