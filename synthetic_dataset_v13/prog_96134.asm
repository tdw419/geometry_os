; DESCRIPTION: Composite: Draws a magenta circle centered at (254, 162) with radius 36 then Places a cyan 45x59 rectangle at position (104, 14).
; PLAN: r0=254(x), r1=162(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=14(y), r7=45(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 162
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 14
LDI r7, 45
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
