; DESCRIPTION: Composite: Places a black dot at position (294, 25) then Places a orange circle of radius 23 at center (422, 112) then Renders a white box of size 43x27 starting at (209, 65).
; PLAN: r0=294(x), r1=25(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=112(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=65(y), r12=43(width), r13=27(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 25
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 422
LDI r6, 112
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 65
LDI r12, 43
LDI r13, 27
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
