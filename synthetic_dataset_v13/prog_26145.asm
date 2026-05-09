; DESCRIPTION: Composite: Places a white dot at position (150, 139) then Renders a red disk with center (178, 189) and radius 62 then Places a yellow 32x15 rectangle at position (471, 93).
; PLAN: r0=150(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=189(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=93(y), r12=32(width), r13=15(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 139
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 189
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 93
LDI r12, 32
LDI r13, 15
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
