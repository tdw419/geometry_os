; DESCRIPTION: Composite: Places a red dot at position (97, 41) then Draws a cyan rectangle at (260, 57) with width 102 and height 69 then Draws a green circle centered at (36, 184) with radius 17.
; PLAN: r0=97(x), r1=41(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=57(y), r7=102(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=36(x), r11=184(y), r12=17(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 41
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 57
LDI r7, 102
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 184
LDI r12, 17
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
