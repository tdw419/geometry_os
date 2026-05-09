; DESCRIPTION: Composite: Places a magenta dot at position (12, 126) then Creates a blue circular shape at (79, 156) with radius 69 then Places a white 65x89 rectangle at position (346, 21).
; PLAN: r0=12(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=156(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x), r11=21(y), r12=65(width), r13=89(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 156
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 21
LDI r12, 65
LDI r13, 89
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
