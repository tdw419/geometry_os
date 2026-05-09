; DESCRIPTION: Composite: Draws a black rectangle at (139, 109) with width 69 and height 86 then Renders a white line between points (150, 52) and (141, 243) then Places a black dot at position (114, 115).
; PLAN: r0=139(x), r1=109(y), r2=69(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=52(y1), r7=141(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=115(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 109
LDI r2, 69
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 52
LDI r7, 141
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 115
LDI r12, 0x000000
PSET r10, r11, r12
HALT
