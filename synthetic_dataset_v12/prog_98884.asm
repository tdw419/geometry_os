; DESCRIPTION: Composite: Creates a orange rectangular region at (354, 73) spanning 34 by 61 pixels then Places a yellow circle of radius 26 at center (424, 130).
; PLAN: r0=354(x), r1=73(y), r2=34(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=130(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 73
LDI r2, 34
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 130
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
