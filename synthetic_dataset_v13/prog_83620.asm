; DESCRIPTION: Composite: Draws a magenta circle centered at (98, 73) with radius 19 then Places a orange 46x89 rectangle at position (112, 141).
; PLAN: r0=98(x), r1=73(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=141(y), r7=46(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 73
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 141
LDI r7, 46
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
