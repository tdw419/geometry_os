; DESCRIPTION: Composite: Creates a yellow circular shape at (350, 94) with radius 69 then Places a red 44x103 rectangle at position (208, 13).
; PLAN: r0=350(x), r1=94(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=13(y), r7=44(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 94
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 13
LDI r7, 44
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
