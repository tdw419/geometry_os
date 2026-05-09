; DESCRIPTION: Composite: Draws a white rectangle at (243, 156) with width 40 and height 19 then Draws a orange circle centered at (92, 204) with radius 22.
; PLAN: r0=243(x), r1=156(y), r2=40(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=204(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 156
LDI r2, 40
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 204
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
