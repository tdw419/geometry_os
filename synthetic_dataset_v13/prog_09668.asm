; DESCRIPTION: Composite: Creates a red rectangular region at (18, 1) spanning 116 by 27 pixels then Places a purple circle of radius 61 at center (132, 153) then Sets a single purple pixel at (474, 169).
; PLAN: r0=18(x), r1=1(y), r2=116(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=153(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x), r11=169(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 1
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 153
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 169
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
