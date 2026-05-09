; DESCRIPTION: Composite: Places a orange dot at position (309, 27) then Draws a red rectangle at (273, 66) with width 71 and height 41 then Draws a red line from (177, 60) to (435, 203).
; PLAN: r0=309(x), r1=27(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=66(y), r7=71(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x1), r11=60(y1), r12=435(x2), r13=203(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 27
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 273
LDI r6, 66
LDI r7, 71
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 60
LDI r12, 435
LDI r13, 203
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
