; DESCRIPTION: Composite: Places a black circle of radius 13 at center (175, 190) then Places a yellow 29x43 rectangle at position (28, 50).
; PLAN: r0=175(x), r1=190(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=50(y), r7=29(width), r8=43(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 190
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 50
LDI r7, 29
LDI r8, 43
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
