; DESCRIPTION: Composite: Places a black circle of radius 70 at center (156, 103) then Renders a purple box of size 117x95 starting at (47, 88).
; PLAN: r0=156(x), r1=103(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=88(y), r7=117(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 103
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 88
LDI r7, 117
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
