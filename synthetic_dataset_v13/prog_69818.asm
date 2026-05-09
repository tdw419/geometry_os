; DESCRIPTION: Composite: Renders a blue disk with center (106, 72) and radius 44 then Draws a magenta rectangle at (401, 41) with width 110 and height 63.
; PLAN: r0=106(x), r1=72(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=41(y), r7=110(width), r8=63(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 72
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 41
LDI r7, 110
LDI r8, 63
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
