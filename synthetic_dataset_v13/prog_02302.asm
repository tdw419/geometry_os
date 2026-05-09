; DESCRIPTION: Composite: Renders a black box of size 86x67 starting at (152, 14) then Creates a yellow circular shape at (271, 87) with radius 39.
; PLAN: r0=152(x), r1=14(y), r2=86(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=87(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 14
LDI r2, 86
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 87
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
