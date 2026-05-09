; DESCRIPTION: Composite: Draws a blue circle centered at (379, 71) with radius 46 then Draws a yellow rectangle at (296, 174) with width 84 and height 81.
; PLAN: r0=379(x), r1=71(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=174(y), r7=84(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 71
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 174
LDI r7, 84
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
