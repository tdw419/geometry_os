; DESCRIPTION: Composite: Creates a black rectangular region at (301, 16) spanning 80 by 18 pixels then Places a yellow circle of radius 50 at center (454, 97).
; PLAN: r0=301(x), r1=16(y), r2=80(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=97(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 16
LDI r2, 80
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 97
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
