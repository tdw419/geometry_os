; DESCRIPTION: Composite: Creates a cyan circular shape at (476, 107) with radius 14 then Places a cyan dot at position (163, 229) then Renders a white box of size 112x100 starting at (246, 76).
; PLAN: r0=476(x), r1=107(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=229(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=76(y), r12=112(width), r13=100(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 107
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 229
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 246
LDI r11, 76
LDI r12, 112
LDI r13, 100
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
