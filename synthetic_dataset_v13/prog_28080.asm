; DESCRIPTION: Composite: Places a orange 58x36 rectangle at position (115, 146) then Places a white dot at position (329, 186) then Renders a red line between points (423, 105) and (504, 203).
; PLAN: r0=115(x), r1=146(y), r2=58(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=186(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=423(x1), r11=105(y1), r12=504(x2), r13=203(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 146
LDI r2, 58
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 186
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 423
LDI r11, 105
LDI r12, 504
LDI r13, 203
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
