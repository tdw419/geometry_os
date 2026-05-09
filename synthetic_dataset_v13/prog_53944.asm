; DESCRIPTION: Composite: Draws a white circle centered at (79, 45) with radius 12 then Renders a blue box of size 10x39 starting at (49, 54).
; PLAN: r0=79(x), r1=45(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=54(y), r7=10(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 45
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 54
LDI r7, 10
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
