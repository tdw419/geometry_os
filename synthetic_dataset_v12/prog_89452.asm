; DESCRIPTION: Composite: Places a magenta 106x60 rectangle at position (237, 105) then Draws a magenta circle centered at (313, 142) with radius 10 then Places a black dot at position (350, 187).
; PLAN: r0=237(x), r1=105(y), r2=106(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=142(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=350(x), r11=187(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 105
LDI r2, 106
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 142
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 350
LDI r11, 187
LDI r12, 0x000000
PSET r10, r11, r12
HALT
