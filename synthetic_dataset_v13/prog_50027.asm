; DESCRIPTION: Composite: Places a white 109x72 rectangle at position (232, 9) then Creates a red circular shape at (416, 173) with radius 77 then Places a black dot at position (262, 193).
; PLAN: r0=232(x), r1=9(y), r2=109(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=173(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=193(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 9
LDI r2, 109
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 173
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 193
LDI r12, 0x000000
PSET r10, r11, r12
HALT
