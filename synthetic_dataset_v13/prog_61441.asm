; DESCRIPTION: Composite: Renders a yellow box of size 107x42 starting at (227, 140) then Renders a yellow disk with center (313, 109) and radius 62 then Places a yellow dot at position (214, 214).
; PLAN: r0=227(x), r1=140(y), r2=107(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=109(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=214(x), r11=214(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 140
LDI r2, 107
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 109
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 214
LDI r11, 214
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
