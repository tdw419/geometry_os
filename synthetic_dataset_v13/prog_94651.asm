; DESCRIPTION: Composite: Creates a red circular shape at (302, 67) with radius 60 then Places a magenta dot at position (342, 136) then Creates a white rectangular region at (401, 92) spanning 67 by 78 pixels.
; PLAN: r0=302(x), r1=67(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=136(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=401(x), r11=92(y), r12=67(width), r13=78(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 67
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 136
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 401
LDI r11, 92
LDI r12, 67
LDI r13, 78
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
