; DESCRIPTION: Composite: Creates a orange circular shape at (90, 91) with radius 57 then Places a blue 46x87 rectangle at position (29, 1).
; PLAN: r0=90(x), r1=91(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=1(y), r7=46(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 91
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 1
LDI r7, 46
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
