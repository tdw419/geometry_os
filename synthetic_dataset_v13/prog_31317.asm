; DESCRIPTION: Composite: Sets a single white pixel at (488, 155) then Creates a magenta circular shape at (409, 121) with radius 74 then Places a magenta 117x50 rectangle at position (115, 143).
; PLAN: r0=488(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=121(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x), r11=143(y), r12=117(width), r13=50(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 121
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 143
LDI r12, 117
LDI r13, 50
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
