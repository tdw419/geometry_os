; DESCRIPTION: Composite: Creates a white rectangular region at (214, 28) spanning 70 by 89 pixels then Renders a red line between points (310, 152) and (315, 44) then Places a white dot at position (311, 191).
; PLAN: r0=214(x), r1=28(y), r2=70(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x1), r6=152(y1), r7=315(x2), r8=44(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=191(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 28
LDI r2, 70
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 152
LDI r7, 315
LDI r8, 44
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 191
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
