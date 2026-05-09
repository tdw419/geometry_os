; DESCRIPTION: Composite: Places a red 29x29 rectangle at position (445, 47) then Creates a yellow circular shape at (432, 126) with radius 69 then Places a cyan dot at position (4, 19).
; PLAN: r0=445(x), r1=47(y), r2=29(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=126(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=19(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 47
LDI r2, 29
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 126
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 19
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
