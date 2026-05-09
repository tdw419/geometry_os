; DESCRIPTION: Composite: Places a magenta circle of radius 56 at center (88, 103) then Places a white 120x100 rectangle at position (343, 7).
; PLAN: r0=88(x), r1=103(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=7(y), r7=120(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 103
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 7
LDI r7, 120
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
