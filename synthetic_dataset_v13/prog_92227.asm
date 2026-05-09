; DESCRIPTION: Composite: Creates a orange rectangular region at (16, 107) spanning 39 by 76 pixels then Places a magenta dot at position (199, 108) then Draws a cyan circle centered at (138, 160) with radius 79.
; PLAN: r0=16(x), r1=107(y), r2=39(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=108(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=160(y), r12=79(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 16
LDI r1, 107
LDI r2, 39
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 108
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 160
LDI r12, 79
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
