; DESCRIPTION: Composite: Renders a red line between points (415, 39) and (312, 121) then Draws a green rectangle at (124, 55) with width 109 and height 107 then Places a white dot at position (478, 219).
; PLAN: r0=415(x1), r1=39(y1), r2=312(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=55(y), r7=109(width), r8=107(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x), r11=219(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 39
LDI r2, 312
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 55
LDI r7, 109
LDI r8, 107
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 219
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
