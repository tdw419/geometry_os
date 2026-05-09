; DESCRIPTION: Composite: Renders a green box of size 50x40 starting at (437, 156) then Draws a yellow circle centered at (425, 97) with radius 28.
; PLAN: r0=437(x), r1=156(y), r2=50(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=97(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 156
LDI r2, 50
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 97
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
