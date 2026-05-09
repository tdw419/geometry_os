; DESCRIPTION: Composite: Draws a magenta rectangle at (279, 57) with width 40 and height 25 then Draws a orange circle centered at (358, 205) with radius 21.
; PLAN: r0=279(x), r1=57(y), r2=40(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=205(y), r7=21(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 57
LDI r2, 40
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 205
LDI r7, 21
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
