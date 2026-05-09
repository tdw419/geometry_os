; DESCRIPTION: Composite: Draws a magenta circle centered at (296, 132) with radius 60 then Creates a orange rectangular region at (66, 98) spanning 22 by 82 pixels.
; PLAN: r0=296(x), r1=132(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=98(y), r7=22(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 132
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 98
LDI r7, 22
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
