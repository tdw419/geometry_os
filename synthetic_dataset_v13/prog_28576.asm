; DESCRIPTION: Composite: Draws a green circle centered at (480, 233) with radius 18 then Renders a magenta box of size 78x83 starting at (3, 5).
; PLAN: r0=480(x), r1=233(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=5(y), r7=78(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 233
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 5
LDI r7, 78
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
