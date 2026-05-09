; DESCRIPTION: Composite: Draws a magenta circle centered at (96, 89) with radius 24 then Places a orange dot at position (202, 0) then Creates a blue rectangular region at (168, 52) spanning 105 by 93 pixels.
; PLAN: r0=96(x), r1=89(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=0(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=52(y), r12=105(width), r13=93(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 89
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 0
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 168
LDI r11, 52
LDI r12, 105
LDI r13, 93
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
