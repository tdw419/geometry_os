; DESCRIPTION: Composite: Places a cyan dot at position (461, 130) then Creates a magenta circular shape at (67, 80) with radius 45 then Places a white 47x51 rectangle at position (109, 161).
; PLAN: r0=461(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=80(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x), r11=161(y), r12=47(width), r13=51(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 80
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 161
LDI r12, 47
LDI r13, 51
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
