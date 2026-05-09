; DESCRIPTION: Composite: Renders a purple box of size 79x51 starting at (49, 115) then Places a magenta dot at position (130, 108) then Creates a orange circular shape at (375, 164) with radius 74.
; PLAN: r0=49(x), r1=115(y), r2=79(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=108(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=164(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 115
LDI r2, 79
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 108
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 375
LDI r11, 164
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
