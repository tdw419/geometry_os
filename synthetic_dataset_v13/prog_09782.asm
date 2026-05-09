; DESCRIPTION: Composite: Renders a green disk with center (405, 108) and radius 35 then Places a black dot at position (377, 159) then Places a orange 29x66 rectangle at position (115, 139).
; PLAN: r0=405(x), r1=108(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=159(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=139(y), r12=29(width), r13=66(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 108
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 159
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 115
LDI r11, 139
LDI r12, 29
LDI r13, 66
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
