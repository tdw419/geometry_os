; DESCRIPTION: Composite: Creates a yellow circular shape at (59, 73) with radius 58 then Places a white 99x63 rectangle at position (128, 26).
; PLAN: r0=59(x), r1=73(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x), r6=26(y), r7=99(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 73
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 26
LDI r7, 99
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
