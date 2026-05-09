; DESCRIPTION: Composite: Creates a red circular shape at (332, 182) with radius 60 then Places a orange dot at position (130, 39) then Creates a magenta rectangular region at (363, 51) spanning 52 by 99 pixels.
; PLAN: r0=332(x), r1=182(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=39(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=51(y), r12=52(width), r13=99(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 182
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 39
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 363
LDI r11, 51
LDI r12, 52
LDI r13, 99
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
