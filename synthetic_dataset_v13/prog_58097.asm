; DESCRIPTION: Composite: Creates a red rectangular region at (271, 58) spanning 82 by 40 pixels then Draws a blue circle centered at (256, 149) with radius 59.
; PLAN: r0=271(x), r1=58(y), r2=82(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=149(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 58
LDI r2, 82
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 149
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
