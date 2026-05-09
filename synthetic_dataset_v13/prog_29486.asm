; DESCRIPTION: Composite: Creates a red circular shape at (304, 127) with radius 79 then Places a blue dot at position (240, 166) then Places a orange 17x18 rectangle at position (458, 81).
; PLAN: r0=304(x), r1=127(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=166(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=458(x), r11=81(y), r12=17(width), r13=18(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 127
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 166
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 458
LDI r11, 81
LDI r12, 17
LDI r13, 18
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
