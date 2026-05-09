; DESCRIPTION: Composite: Creates a orange circular shape at (292, 213) with radius 43 then Places a magenta dot at position (334, 6) then Places a magenta 91x113 rectangle at position (86, 81).
; PLAN: r0=292(x), r1=213(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=6(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=81(y), r12=91(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 213
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 6
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 86
LDI r11, 81
LDI r12, 91
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
