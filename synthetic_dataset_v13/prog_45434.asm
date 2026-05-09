; DESCRIPTION: Composite: Places a red dot at position (239, 186) then Places a orange 85x115 rectangle at position (19, 114) then Renders a red line between points (160, 55) and (17, 130).
; PLAN: r0=239(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=114(y), r7=85(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x1), r11=55(y1), r12=17(x2), r13=130(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 19
LDI r6, 114
LDI r7, 85
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 55
LDI r12, 17
LDI r13, 130
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
