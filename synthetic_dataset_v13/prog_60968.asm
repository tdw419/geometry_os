; DESCRIPTION: Composite: Creates a red rectangular region at (271, 92) spanning 93 by 82 pixels then Draws a yellow circle centered at (258, 180) with radius 53 then Places a red line segment connecting (99, 223) to (64, 184).
; PLAN: r0=271(x), r1=92(y), r2=93(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=180(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x1), r11=223(y1), r12=64(x2), r13=184(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 92
LDI r2, 93
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 180
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 223
LDI r12, 64
LDI r13, 184
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
