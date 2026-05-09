; DESCRIPTION: Composite: Places a red 83x75 rectangle at position (242, 15) then Places a orange dot at position (371, 2) then Creates a red circular shape at (258, 168) with radius 40.
; PLAN: r0=242(x), r1=15(y), r2=83(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=2(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=258(x), r11=168(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 15
LDI r2, 83
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 2
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 258
LDI r11, 168
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
