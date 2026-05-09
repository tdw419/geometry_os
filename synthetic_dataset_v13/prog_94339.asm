; DESCRIPTION: Composite: Draws a yellow circle centered at (442, 190) with radius 16 then Places a red 16x22 rectangle at position (276, 65).
; PLAN: r0=442(x), r1=190(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=65(y), r7=16(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 190
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 65
LDI r7, 16
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
