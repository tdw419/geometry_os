; DESCRIPTION: Composite: Creates a magenta circular shape at (125, 66) with radius 48 then Creates a purple rectangular region at (151, 116) spanning 44 by 108 pixels then Places a magenta dot at position (436, 89).
; PLAN: r0=125(x), r1=66(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=116(y), r7=44(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=89(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 66
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 116
LDI r7, 44
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 89
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
