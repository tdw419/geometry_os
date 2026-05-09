; DESCRIPTION: Composite: Places a magenta 76x117 rectangle at position (190, 34) then Places a purple circle of radius 60 at center (99, 98).
; PLAN: r0=190(x), r1=34(y), r2=76(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=98(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 190
LDI r1, 34
LDI r2, 76
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 98
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
