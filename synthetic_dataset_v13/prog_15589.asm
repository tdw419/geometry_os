; DESCRIPTION: Composite: Sets a single purple pixel at (459, 128) then Renders a white disk with center (211, 229) and radius 15 then Places a white 28x28 rectangle at position (384, 125).
; PLAN: r0=459(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=229(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=125(y), r12=28(width), r13=28(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 229
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 125
LDI r12, 28
LDI r13, 28
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
