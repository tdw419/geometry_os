; DESCRIPTION: Composite: Renders a magenta disk with center (227, 114) and radius 74 then Places a red 22x101 rectangle at position (353, 72).
; PLAN: r0=227(x), r1=114(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=72(y), r7=22(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 114
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 72
LDI r7, 22
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
