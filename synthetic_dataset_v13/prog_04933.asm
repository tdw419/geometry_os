; DESCRIPTION: Composite: Creates a white rectangular region at (281, 127) spanning 48 by 88 pixels then Draws a black line from (291, 11) to (462, 233) then Places a blue dot at position (378, 121).
; PLAN: r0=281(x), r1=127(y), r2=48(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x1), r6=11(y1), r7=462(x2), r8=233(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=121(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 127
LDI r2, 48
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 11
LDI r7, 462
LDI r8, 233
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 121
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
