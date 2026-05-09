; DESCRIPTION: Composite: Places a magenta dot at position (426, 4) then Renders a orange line between points (493, 118) and (186, 143) then Places a red 33x69 rectangle at position (309, 154).
; PLAN: r0=426(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=118(y1), r7=186(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=154(y), r12=33(width), r13=69(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 118
LDI r7, 186
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 154
LDI r12, 33
LDI r13, 69
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
