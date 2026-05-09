; DESCRIPTION: Composite: Draws a red rectangle at (412, 72) with width 73 and height 88 then Draws a cyan circle centered at (316, 107) with radius 46.
; PLAN: r0=412(x), r1=72(y), r2=73(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=107(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 72
LDI r2, 73
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 107
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
