; DESCRIPTION: Composite: Places a magenta circle of radius 16 at center (436, 167) then Places a magenta 15x112 rectangle at position (206, 14).
; PLAN: r0=436(x), r1=167(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=14(y), r7=15(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 167
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 14
LDI r7, 15
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
