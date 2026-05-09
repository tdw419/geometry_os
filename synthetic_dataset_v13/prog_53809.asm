; DESCRIPTION: Composite: Draws a yellow circle centered at (241, 53) with radius 39 then Draws a yellow rectangle at (349, 3) with width 63 and height 40.
; PLAN: r0=241(x), r1=53(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=3(y), r7=63(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 53
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 3
LDI r7, 63
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
