; DESCRIPTION: Composite: Renders a orange box of size 111x67 starting at (257, 138) then Creates a magenta circular shape at (459, 61) with radius 12 then Draws a cyan line from (379, 18) to (11, 7).
; PLAN: r0=257(x), r1=138(y), r2=111(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=61(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x1), r11=18(y1), r12=11(x2), r13=7(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 138
LDI r2, 111
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 61
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 18
LDI r12, 11
LDI r13, 7
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
