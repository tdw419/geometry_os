; DESCRIPTION: Composite: Creates a red rectangular region at (58, 160) spanning 51 by 42 pixels then Places a yellow dot at position (125, 102) then Renders a white disk with center (239, 150) and radius 49.
; PLAN: r0=58(x), r1=160(y), r2=51(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=239(x), r11=150(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 160
LDI r2, 51
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 239
LDI r11, 150
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
