; DESCRIPTION: Composite: Places a magenta 58x60 rectangle at position (7, 115) then Places a black dot at position (284, 229) then Places a white circle of radius 32 at center (427, 89).
; PLAN: r0=7(x), r1=115(y), r2=58(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=229(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=427(x), r11=89(y), r12=32(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 115
LDI r2, 58
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 229
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 427
LDI r11, 89
LDI r12, 32
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
