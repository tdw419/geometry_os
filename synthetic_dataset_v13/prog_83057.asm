; DESCRIPTION: Composite: Places a red circle of radius 60 at center (212, 130) then Renders a purple box of size 30x106 starting at (460, 20).
; PLAN: r0=212(x), r1=130(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=20(y), r7=30(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 130
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 20
LDI r7, 30
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
