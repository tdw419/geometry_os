; DESCRIPTION: Composite: Draws a cyan rectangle at (187, 186) with width 14 and height 26 then Places a green dot at position (362, 115) then Creates a cyan circular shape at (481, 97) with radius 21.
; PLAN: r0=187(x), r1=186(y), r2=14(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=115(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=481(x), r11=97(y), r12=21(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 186
LDI r2, 14
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 115
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 481
LDI r11, 97
LDI r12, 21
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
