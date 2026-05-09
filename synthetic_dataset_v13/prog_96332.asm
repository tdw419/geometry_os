; DESCRIPTION: Composite: Renders a magenta disk with center (246, 142) and radius 59 then Renders a black box of size 58x34 starting at (345, 67).
; PLAN: r0=246(x), r1=142(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=67(y), r7=58(width), r8=34(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 142
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 67
LDI r7, 58
LDI r8, 34
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
