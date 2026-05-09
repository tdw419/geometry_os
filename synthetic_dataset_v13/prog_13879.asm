; DESCRIPTION: Composite: Renders a orange box of size 29x26 starting at (54, 36) then Renders a magenta disk with center (333, 61) and radius 61.
; PLAN: r0=54(x), r1=36(y), r2=29(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=61(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 36
LDI r2, 29
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 61
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
