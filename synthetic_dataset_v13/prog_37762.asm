; DESCRIPTION: Composite: Creates a red rectangular region at (168, 45) spanning 46 by 10 pixels then Places a orange circle of radius 46 at center (131, 183) then Places a orange dot at position (440, 41).
; PLAN: r0=168(x), r1=45(y), r2=46(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=183(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x), r11=41(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 45
LDI r2, 46
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 183
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 41
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
