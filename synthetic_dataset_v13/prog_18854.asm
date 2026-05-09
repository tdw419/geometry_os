; DESCRIPTION: Composite: Renders a purple disk with center (300, 130) and radius 70 then Places a magenta 36x34 rectangle at position (417, 53).
; PLAN: r0=300(x), r1=130(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=53(y), r7=36(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 130
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 53
LDI r7, 36
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
