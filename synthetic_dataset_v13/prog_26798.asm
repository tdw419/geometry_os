; DESCRIPTION: Composite: Renders a green disk with center (196, 97) and radius 78 then Renders a yellow box of size 11x116 starting at (197, 6).
; PLAN: r0=196(x), r1=97(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=6(y), r7=11(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 97
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 6
LDI r7, 11
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
