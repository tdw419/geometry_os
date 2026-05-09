; DESCRIPTION: Composite: Draws a green circle centered at (434, 39) with radius 38 then Renders a blue box of size 24x103 starting at (150, 121).
; PLAN: r0=434(x), r1=39(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=121(y), r7=24(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 39
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 121
LDI r7, 24
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
