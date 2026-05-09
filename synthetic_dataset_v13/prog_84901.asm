; DESCRIPTION: Composite: Places a red 112x56 rectangle at position (228, 20) then Places a magenta circle of radius 60 at center (240, 173).
; PLAN: r0=228(x), r1=20(y), r2=112(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=173(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 20
LDI r2, 112
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 173
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
