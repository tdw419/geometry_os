; DESCRIPTION: Composite: Renders a magenta disk with center (326, 52) and radius 50 then Draws a magenta rectangle at (386, 70) with width 54 and height 90.
; PLAN: r0=326(x), r1=52(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=70(y), r7=54(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 52
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 70
LDI r7, 54
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
