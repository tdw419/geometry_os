; DESCRIPTION: Composite: Renders a cyan box of size 41x68 starting at (328, 106) then Places a cyan dot at position (113, 138) then Creates a red circular shape at (366, 97) with radius 31.
; PLAN: r0=328(x), r1=106(y), r2=41(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=138(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=97(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 106
LDI r2, 41
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 138
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 97
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
