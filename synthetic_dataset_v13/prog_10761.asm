; DESCRIPTION: Composite: Places a red circle of radius 50 at center (390, 165) then Places a yellow 99x26 rectangle at position (246, 203).
; PLAN: r0=390(x), r1=165(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=203(y), r7=99(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 165
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 203
LDI r7, 99
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
