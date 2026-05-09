; DESCRIPTION: Composite: Sets a single orange pixel at (58, 184) then Creates a white circular shape at (27, 155) with radius 24 then Renders a green box of size 41x85 starting at (405, 107).
; PLAN: r0=58(x), r1=184(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=155(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=107(y), r12=41(width), r13=85(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 184
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 27
LDI r6, 155
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 107
LDI r12, 41
LDI r13, 85
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
