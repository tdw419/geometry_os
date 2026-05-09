; DESCRIPTION: Composite: Places a orange dot at position (183, 155) then Renders a cyan box of size 89x57 starting at (86, 12) then Renders a orange line between points (7, 184) and (7, 250).
; PLAN: r0=183(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=12(y), r7=89(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=7(x1), r11=184(y1), r12=7(x2), r13=250(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 155
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 86
LDI r6, 12
LDI r7, 89
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 184
LDI r12, 7
LDI r13, 250
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
