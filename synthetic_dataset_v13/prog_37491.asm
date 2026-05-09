; DESCRIPTION: Composite: Renders a white disk with center (221, 35) and radius 35 then Creates a black rectangular region at (89, 215) spanning 10 by 32 pixels then Places a white dot at position (357, 229).
; PLAN: r0=221(x), r1=35(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=215(y), r7=10(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=357(x), r11=229(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 35
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 215
LDI r7, 10
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 229
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
