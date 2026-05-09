; DESCRIPTION: Composite: Renders a black line between points (148, 71) and (334, 16) then Draws a green rectangle at (276, 61) with width 100 and height 55 then Places a cyan dot at position (75, 174).
; PLAN: r0=148(x1), r1=71(y1), r2=334(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=61(y), r7=100(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=174(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 71
LDI r2, 334
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 61
LDI r7, 100
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 174
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
