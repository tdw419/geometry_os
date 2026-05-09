; DESCRIPTION: Composite: Renders a yellow disk with center (205, 70) and radius 62 then Places a magenta 64x69 rectangle at position (154, 118).
; PLAN: r0=205(x), r1=70(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=118(y), r7=64(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 70
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 118
LDI r7, 64
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
