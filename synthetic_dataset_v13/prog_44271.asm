; DESCRIPTION: Composite: Places a red 30x115 rectangle at position (375, 137) then Creates a white circular shape at (441, 138) with radius 18.
; PLAN: r0=375(x), r1=137(y), r2=30(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=138(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 137
LDI r2, 30
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 138
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
