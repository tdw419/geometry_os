; DESCRIPTION: Composite: Draws a green circle centered at (312, 171) with radius 30 then Places a white dot at position (35, 223) then Places a green 87x116 rectangle at position (236, 114).
; PLAN: r0=312(x), r1=171(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=223(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=236(x), r11=114(y), r12=87(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 171
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 223
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 236
LDI r11, 114
LDI r12, 87
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
