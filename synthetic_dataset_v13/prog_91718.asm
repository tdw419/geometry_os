; DESCRIPTION: Composite: Renders a white disk with center (452, 119) and radius 41 then Places a magenta dot at position (263, 3) then Renders a black box of size 18x29 starting at (250, 220).
; PLAN: r0=452(x), r1=119(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=3(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=250(x), r11=220(y), r12=18(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 119
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 3
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 250
LDI r11, 220
LDI r12, 18
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
