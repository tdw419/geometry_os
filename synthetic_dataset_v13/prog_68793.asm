; DESCRIPTION: Composite: Draws a red rectangle at (281, 173) with width 44 and height 82 then Places a yellow circle of radius 78 at center (100, 86).
; PLAN: r0=281(x), r1=173(y), r2=44(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=86(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 173
LDI r2, 44
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 86
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
