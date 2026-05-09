; DESCRIPTION: Composite: Draws a yellow circle centered at (192, 174) with radius 50 then Renders a white box of size 113x26 starting at (321, 156).
; PLAN: r0=192(x), r1=174(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=156(y), r7=113(width), r8=26(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 174
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 156
LDI r7, 113
LDI r8, 26
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
