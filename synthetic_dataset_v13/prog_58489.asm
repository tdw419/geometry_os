; DESCRIPTION: Composite: Draws a red rectangle at (403, 22) with width 88 and height 48 then Sets a single green pixel at (223, 196) then Draws a yellow circle centered at (420, 136) with radius 40.
; PLAN: r0=403(x), r1=22(y), r2=88(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=196(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=136(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 22
LDI r2, 88
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 196
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 420
LDI r11, 136
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
