; DESCRIPTION: Composite: Creates a yellow circular shape at (198, 124) with radius 68 then Places a orange 112x53 rectangle at position (354, 165).
; PLAN: r0=198(x), r1=124(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=165(y), r7=112(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 124
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 165
LDI r7, 112
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
