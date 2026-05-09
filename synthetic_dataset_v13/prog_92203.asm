; DESCRIPTION: Composite: Renders a magenta disk with center (281, 36) and radius 18 then Places a magenta 90x78 rectangle at position (173, 167).
; PLAN: r0=281(x), r1=36(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=167(y), r7=90(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 36
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 167
LDI r7, 90
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
