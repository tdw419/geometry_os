; DESCRIPTION: Composite: Renders a black box of size 91x100 starting at (40, 3) then Creates a orange circular shape at (120, 163) with radius 37 then Places a black dot at position (186, 46).
; PLAN: r0=40(x), r1=3(y), r2=91(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=163(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=46(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 3
LDI r2, 91
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 163
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 46
LDI r12, 0x000000
PSET r10, r11, r12
HALT
