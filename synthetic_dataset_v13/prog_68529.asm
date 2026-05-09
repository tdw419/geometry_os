; DESCRIPTION: Composite: Places a black 112x71 rectangle at position (163, 126) then Renders a yellow disk with center (284, 191) and radius 43.
; PLAN: r0=163(x), r1=126(y), r2=112(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=191(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 126
LDI r2, 112
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 191
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
