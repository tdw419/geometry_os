; DESCRIPTION: Composite: Renders a yellow box of size 78x41 starting at (321, 93) then Places a magenta dot at position (488, 225) then Creates a red circular shape at (172, 163) with radius 39.
; PLAN: r0=321(x), r1=93(y), r2=78(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=225(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=172(x), r11=163(y), r12=39(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 93
LDI r2, 78
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 225
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 172
LDI r11, 163
LDI r12, 39
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
