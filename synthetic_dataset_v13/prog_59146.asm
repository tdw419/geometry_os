; DESCRIPTION: Composite: Places a white dot at position (250, 49) then Places a black circle of radius 60 at center (173, 71) then Renders a white box of size 39x21 starting at (423, 30).
; PLAN: r0=250(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=71(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=30(y), r12=39(width), r13=21(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 71
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 30
LDI r12, 39
LDI r13, 21
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
