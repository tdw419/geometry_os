; DESCRIPTION: Composite: Creates a white rectangular region at (10, 79) spanning 111 by 111 pixels then Places a cyan dot at position (271, 51) then Creates a magenta circular shape at (456, 227) with radius 28.
; PLAN: r0=10(x), r1=79(y), r2=111(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=51(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=456(x), r11=227(y), r12=28(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 79
LDI r2, 111
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 51
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 456
LDI r11, 227
LDI r12, 28
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
