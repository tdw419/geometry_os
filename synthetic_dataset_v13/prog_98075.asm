; DESCRIPTION: Composite: Places a black dot at position (126, 130) then Creates a magenta circular shape at (202, 128) with radius 48 then Places a purple 51x50 rectangle at position (241, 113).
; PLAN: r0=126(x), r1=130(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=128(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=113(y), r12=51(width), r13=50(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 130
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 128
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 113
LDI r12, 51
LDI r13, 50
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
