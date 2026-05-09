; DESCRIPTION: Composite: Creates a black circular shape at (267, 79) with radius 56 then Sets a single green pixel at (51, 199) then Places a black 106x116 rectangle at position (307, 45).
; PLAN: r0=267(x), r1=79(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=199(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=45(y), r12=106(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 79
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 199
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 307
LDI r11, 45
LDI r12, 106
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
