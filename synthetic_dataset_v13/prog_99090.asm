; DESCRIPTION: Composite: Draws a purple circle centered at (408, 79) with radius 57 then Renders a red box of size 115x34 starting at (100, 1).
; PLAN: r0=408(x), r1=79(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=1(y), r7=115(width), r8=34(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 79
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 1
LDI r7, 115
LDI r8, 34
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
