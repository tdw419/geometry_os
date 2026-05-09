; DESCRIPTION: Composite: Sets a single blue pixel at (432, 184) then Places a red 56x102 rectangle at position (452, 137) then Places a white circle of radius 71 at center (138, 181).
; PLAN: r0=432(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=137(y), r7=56(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x), r11=181(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 432
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 137
LDI r7, 56
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 181
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
