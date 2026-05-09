; DESCRIPTION: Composite: Renders a black disk with center (280, 107) and radius 80 then Places a white dot at position (285, 164) then Renders a black box of size 100x59 starting at (171, 73).
; PLAN: r0=280(x), r1=107(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=164(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=73(y), r12=100(width), r13=59(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 107
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 164
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 171
LDI r11, 73
LDI r12, 100
LDI r13, 59
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
