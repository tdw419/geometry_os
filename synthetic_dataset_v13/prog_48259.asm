; DESCRIPTION: Composite: Draws a red circle centered at (176, 210) with radius 39 then Sets a single orange pixel at (478, 177) then Creates a magenta rectangular region at (226, 59) spanning 81 by 22 pixels.
; PLAN: r0=176(x), r1=210(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x), r6=177(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=226(x), r11=59(y), r12=81(width), r13=22(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 210
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 177
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 226
LDI r11, 59
LDI r12, 81
LDI r13, 22
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
