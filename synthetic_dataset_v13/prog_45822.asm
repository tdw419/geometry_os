; DESCRIPTION: Composite: Places a red dot at position (197, 214) then Creates a white circular shape at (174, 125) with radius 77 then Draws a black rectangle at (183, 82) with width 37 and height 42.
; PLAN: r0=197(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=125(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=82(y), r12=37(width), r13=42(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 174
LDI r6, 125
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 82
LDI r12, 37
LDI r13, 42
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
