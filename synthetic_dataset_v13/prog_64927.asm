; DESCRIPTION: Composite: Renders a green disk with center (299, 180) and radius 15 then Draws a yellow rectangle at (237, 57) with width 56 and height 58.
; PLAN: r0=299(x), r1=180(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=57(y), r7=56(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 180
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 57
LDI r7, 56
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
