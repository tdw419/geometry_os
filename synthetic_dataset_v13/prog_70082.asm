; DESCRIPTION: Composite: Places a magenta 26x96 rectangle at position (344, 55) then Places a orange circle of radius 74 at center (157, 79).
; PLAN: r0=344(x), r1=55(y), r2=26(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=79(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 55
LDI r2, 26
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 79
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
