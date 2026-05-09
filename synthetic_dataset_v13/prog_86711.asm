; DESCRIPTION: Composite: Creates a blue rectangular region at (59, 197) spanning 113 by 39 pixels then Creates a orange circular shape at (223, 157) with radius 14.
; PLAN: r0=59(x), r1=197(y), r2=113(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=157(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 59
LDI r1, 197
LDI r2, 113
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 157
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
