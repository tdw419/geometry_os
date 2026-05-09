; DESCRIPTION: Composite: Places a green 28x58 rectangle at position (332, 62) then Renders a yellow disk with center (246, 151) and radius 53.
; PLAN: r0=332(x), r1=62(y), r2=28(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=151(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 332
LDI r1, 62
LDI r2, 28
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 151
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
