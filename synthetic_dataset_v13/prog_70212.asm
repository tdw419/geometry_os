; DESCRIPTION: Composite: Creates a purple rectangular region at (271, 58) spanning 81 by 59 pixels then Renders a green disk with center (424, 71) and radius 62.
; PLAN: r0=271(x), r1=58(y), r2=81(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=71(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 58
LDI r2, 81
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 71
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
