; DESCRIPTION: Composite: Sets a single red pixel at (135, 147) then Places a magenta circle of radius 59 at center (381, 191) then Creates a magenta rectangular region at (305, 93) spanning 49 by 12 pixels.
; PLAN: r0=135(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=191(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=93(y), r12=49(width), r13=12(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 381
LDI r6, 191
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 93
LDI r12, 49
LDI r13, 12
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
