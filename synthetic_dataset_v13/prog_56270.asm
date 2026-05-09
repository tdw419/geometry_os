; DESCRIPTION: Composite: Draws a purple circle centered at (256, 54) with radius 13 then Places a purple 104x91 rectangle at position (11, 52).
; PLAN: r0=256(x), r1=54(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=52(y), r7=104(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 54
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 52
LDI r7, 104
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
