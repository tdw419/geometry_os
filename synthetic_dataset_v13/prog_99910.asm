; DESCRIPTION: Composite: Sets a single yellow pixel at (31, 140) then Draws a cyan rectangle at (10, 34) with width 116 and height 107 then Renders a red line between points (225, 138) and (138, 82).
; PLAN: r0=31(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=34(y), r7=116(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x1), r11=138(y1), r12=138(x2), r13=82(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 10
LDI r6, 34
LDI r7, 116
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 138
LDI r12, 138
LDI r13, 82
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
