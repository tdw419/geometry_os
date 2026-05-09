; DESCRIPTION: Composite: Creates a green circular shape at (354, 116) with radius 15 then Creates a purple rectangular region at (259, 67) spanning 68 by 111 pixels.
; PLAN: r0=354(x), r1=116(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=67(y), r7=68(width), r8=111(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 116
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 67
LDI r7, 68
LDI r8, 111
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
