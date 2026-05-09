; DESCRIPTION: Composite: Places a white dot at position (298, 47) then Draws a red rectangle at (104, 149) with width 93 and height 107 then Draws a black line from (490, 62) to (378, 37).
; PLAN: r0=298(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=149(y), r7=93(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=490(x1), r11=62(y1), r12=378(x2), r13=37(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 104
LDI r6, 149
LDI r7, 93
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 62
LDI r12, 378
LDI r13, 37
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
