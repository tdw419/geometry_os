; DESCRIPTION: Composite: Places a magenta 41x89 rectangle at position (442, 31) then Creates a red circular shape at (443, 161) with radius 68 then Places a black dot at position (166, 222).
; PLAN: r0=442(x), r1=31(y), r2=41(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=161(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x), r11=222(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 31
LDI r2, 41
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 161
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 222
LDI r12, 0x000000
PSET r10, r11, r12
HALT
