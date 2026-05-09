; DESCRIPTION: Composite: Draws a black rectangle at (138, 121) with width 24 and height 82 then Renders a green line between points (361, 3) and (459, 120) then Places a orange dot at position (89, 88).
; PLAN: r0=138(x), r1=121(y), r2=24(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x1), r6=3(y1), r7=459(x2), r8=120(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=88(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 121
LDI r2, 24
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 3
LDI r7, 459
LDI r8, 120
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 88
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
