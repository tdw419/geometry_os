; DESCRIPTION: Composite: Creates a red rectangular region at (265, 56) spanning 40 by 59 pixels then Places a yellow circle of radius 44 at center (359, 98).
; PLAN: r0=265(x), r1=56(y), r2=40(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=98(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 56
LDI r2, 40
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 98
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
