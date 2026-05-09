; DESCRIPTION: Composite: Sets a single magenta pixel at (385, 143) then Renders a magenta disk with center (79, 173) and radius 77 then Creates a purple rectangular region at (22, 239) spanning 101 by 11 pixels.
; PLAN: r0=385(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=173(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=239(y), r12=101(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 173
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 239
LDI r12, 101
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
