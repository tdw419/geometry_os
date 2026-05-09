; DESCRIPTION: Composite: Places a blue dot at position (482, 245) then Places a yellow 109x75 rectangle at position (141, 102) then Creates a red circular shape at (238, 98) with radius 59.
; PLAN: r0=482(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=102(y), r7=109(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=98(y), r12=59(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 102
LDI r7, 109
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 98
LDI r12, 59
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
