; DESCRIPTION: Composite: Places a cyan circle of radius 38 at center (384, 166) then Draws a magenta rectangle at (296, 108) with width 51 and height 25.
; PLAN: r0=384(x), r1=166(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=108(y), r7=51(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 166
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 108
LDI r7, 51
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
