; DESCRIPTION: Composite: Draws a orange circle centered at (135, 61) with radius 20 then Renders a magenta box of size 37x90 starting at (61, 61).
; PLAN: r0=135(x), r1=61(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=61(y), r7=37(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 61
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 61
LDI r7, 37
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
