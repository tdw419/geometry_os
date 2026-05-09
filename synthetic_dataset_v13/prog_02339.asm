; DESCRIPTION: Composite: Sets a single yellow pixel at (185, 239) then Renders a orange line between points (170, 92) and (252, 243) then Places a red 54x114 rectangle at position (44, 60).
; PLAN: r0=185(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=170(x1), r6=92(y1), r7=252(x2), r8=243(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=60(y), r12=54(width), r13=114(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 170
LDI r6, 92
LDI r7, 252
LDI r8, 243
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 60
LDI r12, 54
LDI r13, 114
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
