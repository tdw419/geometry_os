; DESCRIPTION: Composite: Creates a green circular shape at (330, 111) with radius 52 then Draws a red rectangle at (357, 15) with width 35 and height 95.
; PLAN: r0=330(x), r1=111(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=15(y), r7=35(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 111
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 15
LDI r7, 35
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
