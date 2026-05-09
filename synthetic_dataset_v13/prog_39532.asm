; DESCRIPTION: Composite: Draws a blue line from (134, 75) to (221, 163) then Draws a green rectangle at (458, 27) with width 41 and height 14 then Places a magenta dot at position (131, 135).
; PLAN: r0=134(x1), r1=75(y1), r2=221(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=27(y), r7=41(width), r8=14(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=131(x), r11=135(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 75
LDI r2, 221
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 27
LDI r7, 41
LDI r8, 14
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 135
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
