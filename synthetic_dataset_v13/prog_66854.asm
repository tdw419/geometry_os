; DESCRIPTION: Composite: Places a black dot at position (299, 242) then Renders a green disk with center (159, 196) and radius 17 then Places a purple 72x74 rectangle at position (189, 125).
; PLAN: r0=299(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=196(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x), r11=125(y), r12=72(width), r13=74(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 159
LDI r6, 196
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 125
LDI r12, 72
LDI r13, 74
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
