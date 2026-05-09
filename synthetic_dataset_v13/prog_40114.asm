; DESCRIPTION: Composite: Draws a green rectangle at (42, 104) with width 90 and height 103 then Renders a red line between points (149, 226) and (310, 82) then Places a cyan dot at position (382, 78).
; PLAN: r0=42(x), r1=104(y), r2=90(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=226(y1), r7=310(x2), r8=82(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=78(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 104
LDI r2, 90
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 226
LDI r7, 310
LDI r8, 82
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 78
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
