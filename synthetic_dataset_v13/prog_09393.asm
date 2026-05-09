; DESCRIPTION: Composite: Creates a red rectangular region at (127, 1) spanning 64 by 98 pixels then Places a purple dot at position (397, 163) then Renders a red disk with center (232, 116) and radius 68.
; PLAN: r0=127(x), r1=1(y), r2=64(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=163(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=116(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 127
LDI r1, 1
LDI r2, 64
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 163
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 232
LDI r11, 116
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
