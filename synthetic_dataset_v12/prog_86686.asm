; DESCRIPTION: Composite: Creates a red rectangular region at (20, 95) spanning 71 by 53 pixels then Draws a purple circle centered at (294, 94) with radius 13 then Places a red line segment connecting (220, 129) to (131, 182).
; PLAN: r0=20(x), r1=95(y), r2=71(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=94(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x1), r11=129(y1), r12=131(x2), r13=182(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 95
LDI r2, 71
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 94
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 129
LDI r12, 131
LDI r13, 182
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
