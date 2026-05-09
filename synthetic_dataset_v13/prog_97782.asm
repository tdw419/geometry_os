; DESCRIPTION: Composite: Creates a white circular shape at (397, 127) with radius 80 then Places a magenta dot at position (497, 27) then Creates a red rectangular region at (164, 75) spanning 49 by 51 pixels.
; PLAN: r0=397(x), r1=127(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x), r6=27(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=75(y), r12=49(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 127
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 27
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 164
LDI r11, 75
LDI r12, 49
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
