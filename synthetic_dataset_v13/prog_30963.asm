; DESCRIPTION: Composite: Places a green 12x92 rectangle at position (475, 15) then Places a white dot at position (204, 65) then Creates a red circular shape at (383, 86) with radius 46.
; PLAN: r0=475(x), r1=15(y), r2=12(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=65(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=86(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 15
LDI r2, 12
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 65
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 86
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
