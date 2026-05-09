; DESCRIPTION: Composite: Draws a yellow circle centered at (268, 114) with radius 80 then Renders a black box of size 67x100 starting at (262, 37).
; PLAN: r0=268(x), r1=114(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=37(y), r7=67(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 114
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 37
LDI r7, 67
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
