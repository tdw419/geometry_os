; DESCRIPTION: Composite: Places a magenta dot at position (286, 102) then Draws a magenta circle centered at (413, 149) with radius 10 then Creates a magenta rectangular region at (367, 134) spanning 82 by 104 pixels.
; PLAN: r0=286(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=149(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=134(y), r12=82(width), r13=104(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 149
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 134
LDI r12, 82
LDI r13, 104
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
