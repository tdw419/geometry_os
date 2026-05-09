; DESCRIPTION: Composite: Draws a magenta circle centered at (114, 174) with radius 80 then Places a blue dot at position (334, 92) then Places a blue 93x47 rectangle at position (223, 6).
; PLAN: r0=114(x), r1=174(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=6(y), r12=93(width), r13=47(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 174
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 6
LDI r12, 93
LDI r13, 47
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
