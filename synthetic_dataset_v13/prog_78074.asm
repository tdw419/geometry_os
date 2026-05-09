; DESCRIPTION: Composite: Creates a black rectangular region at (114, 114) spanning 84 by 46 pixels then Places a black circle of radius 71 at center (218, 150).
; PLAN: r0=114(x), r1=114(y), r2=84(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=150(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 114
LDI r2, 84
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 150
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
