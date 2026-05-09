; DESCRIPTION: Composite: Renders a green line between points (334, 102) and (410, 166) then Sets a single orange pixel at (269, 126) then Draws a green rectangle at (146, 41) with width 116 and height 103.
; PLAN: r0=334(x1), r1=102(y1), r2=410(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=126(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=41(y), r12=116(width), r13=103(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 102
LDI r2, 410
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 126
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 146
LDI r11, 41
LDI r12, 116
LDI r13, 103
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
