; DESCRIPTION: Composite: Places a red circle of radius 36 at center (253, 71) then Renders a magenta box of size 69x75 starting at (307, 178).
; PLAN: r0=253(x), r1=71(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=178(y), r7=69(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 71
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 178
LDI r7, 69
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
