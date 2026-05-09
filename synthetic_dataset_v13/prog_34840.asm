; DESCRIPTION: Composite: Creates a red circular shape at (380, 126) with radius 78 then Renders a magenta box of size 33x24 starting at (205, 3) then Renders a green line between points (155, 67) and (289, 101).
; PLAN: r0=380(x), r1=126(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=3(y), r7=33(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x1), r11=67(y1), r12=289(x2), r13=101(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 126
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 3
LDI r7, 33
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 67
LDI r12, 289
LDI r13, 101
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
