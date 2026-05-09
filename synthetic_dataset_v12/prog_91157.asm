; DESCRIPTION: Composite: Draws a green circle centered at (436, 182) with radius 43 then Renders a green box of size 64x94 starting at (54, 103).
; PLAN: r0=436(x), r1=182(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=103(y), r7=64(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 182
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 103
LDI r7, 64
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
