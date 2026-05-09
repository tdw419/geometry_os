; DESCRIPTION: Composite: Places a orange dot at position (311, 150) then Renders a yellow line between points (230, 102) and (387, 29) then Places a red 11x87 rectangle at position (55, 71).
; PLAN: r0=311(x), r1=150(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=102(y1), r7=387(x2), r8=29(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=71(y), r12=11(width), r13=87(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 150
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 230
LDI r6, 102
LDI r7, 387
LDI r8, 29
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 71
LDI r12, 11
LDI r13, 87
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
