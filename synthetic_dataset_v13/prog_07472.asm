; DESCRIPTION: Composite: Draws a red rectangle at (24, 7) with width 91 and height 113 then Creates a white circular shape at (197, 198) with radius 48.
; PLAN: r0=24(x), r1=7(y), r2=91(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=198(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 7
LDI r2, 91
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 198
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
