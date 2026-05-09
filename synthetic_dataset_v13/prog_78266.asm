; DESCRIPTION: Composite: Draws a orange circle centered at (211, 94) with radius 29 then Renders a blue box of size 105x98 starting at (204, 120).
; PLAN: r0=211(x), r1=94(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=120(y), r7=105(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 94
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 120
LDI r7, 105
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
