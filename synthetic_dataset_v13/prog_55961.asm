; DESCRIPTION: Composite: Creates a red circular shape at (193, 171) with radius 59 then Sets a single black pixel at (326, 173) then Creates a black rectangular region at (243, 157) spanning 51 by 81 pixels.
; PLAN: r0=193(x), r1=171(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=173(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=157(y), r12=51(width), r13=81(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 171
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 173
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 243
LDI r11, 157
LDI r12, 51
LDI r13, 81
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
